package lokyiec.sqlData;

import weka.associations.Apriori;
import weka.associations.AssociationRule;
import weka.associations.AssociationRules;
import weka.associations.Item;
import weka.core.Instances;
import weka.core.Utils;

import java.util.Collection;
import java.util.Iterator;
import java.util.List;


/**
 *
 * Klasa testuje mozliwosc asocjacji metoda Apriori na danych popranych z bazy danych
 *
 */


public class TestHotel {

    static public void main(String [] args) {
        try {
            String username = "postgres";
            String password = "changeme";

            String query =
                    "SELECT STRING_AGG(UH.USLUG_NAZWA, ', ')\n" +
                            "FROM USLUGI_HOTELOWE UH\n" +
                            "JOIN UZYTE_USLUGI UU ON UH.USLUG_ID = UU.USLUG_ID\n" +
                            "JOIN REZERWACJE R ON UU.REZ_ID = R.REZ_ID\n" +
                            "JOIN GOSCIE G ON R.GOSC_ID = G.GOSC_ID\n" +
                            "GROUP BY UU.REZ_ID\n" +
                            "ORDER BY UU.REZ_ID";

            Instances data = SQLDataImporter.getDataSetFromPostgreSQL(username,password,query,0);
            String fileName = "./src/data/from_postgresql.arff"; //Lokalizacja pliku z danymi
            BasicTools.saveData(data, fileName); //Zapis tablicy do pliku w fromacie ARFF
            BasicTools.processToApriori(data);
            data = BasicTools.loadData(fileName);




            data.setClassIndex(data.numAttributes() - 1);

            String[] options = Utils.splitOptions("-N 10 -C 0.2 -M 0.01");
            Apriori apriori = new Apriori();
            apriori.setOptions(options);
            apriori.buildAssociations(data);

            System.out.println("Liczba regul: " + apriori.getNumRules());

            AssociationRules rules = apriori.getAssociationRules();
            List<AssociationRule> ruleList = rules.getRules();

            for (int i=0; i<ruleList.size(); i++) {
                AssociationRule rule = ruleList.get(i); //Pobranie pojedynczej reguly


                //Pobranie opisu poprzednika reguly
                Collection<Item> poprzednik = rule.getPremise();
                Iterator<Item> iteratorPoprzednik = poprzednik.iterator();
                String poprzednikText = new String();
                while (iteratorPoprzednik.hasNext())
                {
                    poprzednikText = poprzednikText + "("+iteratorPoprzednik.next().toString()+")";
                    if (iteratorPoprzednik.hasNext()) poprzednikText = poprzednikText +"&";
                }


                //Pobranie opisu nastepnika reguly
                Collection<Item> nastepnik = rule.getConsequence();
                Iterator<Item> iteratorNastepnik = nastepnik.iterator();
                String nastepnikText = new String();
                while (iteratorNastepnik.hasNext())
                {
                    nastepnikText = nastepnikText + "("+iteratorNastepnik.next().toString()+")";
                    if (iteratorNastepnik.hasNext()) nastepnikText = nastepnikText +"&";
                }


                //Pobranie wsparcie i obliczenia ufnosci
                int wsparciePoprzednika = rule.getPremiseSupport();
                int wsparcieCalosci = rule.getTotalSupport();
                double ufnosc = (double)wsparcieCalosci/wsparciePoprzednika;


                System.out.print(poprzednikText+" => "+nastepnikText+", ");
                System.out.print("Wsparcie:" + Math.round(wsparcieCalosci * 1000.0) / 1000.0 + ", ");
                System.out.println("Ufnosc:" + Math.round(ufnosc * 1000.0) / 1000.0);

            }



        }
        catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }
        System.out.println("KONIEC");
    }
}

