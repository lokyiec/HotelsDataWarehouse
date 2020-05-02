package lokyiec.sqlData;

import weka.core.Instances;
import weka.core.converters.ArffLoader;
import weka.core.converters.ArffSaver;
import weka.core.converters.CSVLoader;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


public class BasicTools {

    //Odczytanie tablicy danych z dysku w formacie ARFF
    public static Instances loadData(String fileName)
            throws IOException
    {
        ArffLoader loader = new ArffLoader(); //Utworzenie obiektu czytajacego dane z formatu ARFF
        loader.setFile(new File(fileName)); //Ustawienie pliku do odczytania
        return loader.getDataSet(); //Odczytanie danych z pliku
    }

    //Importowanie danych z formatu CSV do formatu ARFF
    public static void importCSVtoARFF(String fileNameCSV,String fileNameARFF)
            throws IOException
    {
        CSVLoader loader = new CSVLoader(); //Utworzenie obiektu czytajacego dane z formatu CSV
        loader.setSource(new File(fileNameCSV)); //Ustawienie pliku do odczytania
        Instances data = loader.getDataSet(); //Odczytanie danych z pliku
        saveData(data,fileNameARFF); //Zapis tablicy do pliku w romacie ARFF
    }

    //Zapis zbioru danych do formatu ARFF
    public static void saveData(Instances data,String fileName)
            throws IOException
    {
        ArffSaver saver = new ArffSaver(); //Utworzenie obiektu zapisujacego dane
        saver.setFile(new File(fileName)); //Ustawienie nazwy pliku do zapisu
        saver.setInstances(data);
        saver.writeBatch(); //Zapis do pliku
    }

    // Przygotowanie danych do asocjacji algorytmem Apriori
    static public void processToApriori(Instances data) throws Exception {
        String username = "postgres";
        String password = "changeme";
        String query = "SELECT USLUG_NAZWA FROM USLUGI_HOTELOWE";

        Instances uslugi = SQLDataImporter.getDataSetFromPostgreSQL(username, password, query, 0);

        ArrayList<String> services = new ArrayList<String>(uslugi.size());
        for (int i = 0; i < uslugi.size(); i++)  {
            services.add(uslugi.get(i).toString().replace("'", ""));
        }

        ArrayList<String> dataOut = new ArrayList<String>();

        for (int i = 0; i < data.size(); i++) {

            String s = "";
            StringBuilder sB = new StringBuilder(s);

            for (int j = 0; j < services.size(); j++) {
                if (data.get(i).toString().contains(services.get(j)))
                    sB.append("t,");
                else if (j == services.size() - 1)
                    sB.append("?");
                else
                    sB.append("?,");
            }

            if (sB.length() == 22)   sB.deleteCharAt(sB.length() - 1);

            s = sB.toString();
            dataOut.add(s);

        }
        String filename = "./src/data/from_postgresql.arff";
        PrintWriter out = new PrintWriter(filename);
        out.println("@relation Uslugi");
        out.println();
        for (int i = 0; i < services.size(); i++) {
            out.println("@attribute '" + services.get(i) + "' {t}");
        }
        out.println();
        out.println("@data");
        for (int i = 0; i < dataOut.size(); i++) {
            out.println(dataOut.get(i));
        }
        out.close();

    }
}
