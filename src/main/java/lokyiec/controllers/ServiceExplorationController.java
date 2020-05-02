package lokyiec.controllers;

import lokyiec.sqlData.SQLDataImporter;
import lokyiec.sqlData.BasicTools;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import lokyiec.sqlData.BasicTools;
import lokyiec.sqlData.SQLDataImporter;
import weka.associations.Apriori;
import weka.associations.AssociationRule;
import weka.associations.AssociationRules;
import weka.associations.Item;
import weka.core.Instances;
import weka.core.Utils;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public class ServiceExplorationController {

    @FXML
    private TextArea associationData;

    @FXML
    private TextField minRules;

    @FXML
    private TextField minSupp;

    @FXML
    private TextField minMetric;

    @FXML
    void pokaz(ActionEvent event) {
        przeladuj();
    }

    // "-N 10 -C 0.2 -M 0.01"

    @FXML
    void initialize() {
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

            Instances data = SQLDataImporter.getDataSetFromPostgreSQL(username, password, query, 0);
            String fileName = "./src/data/from_postgresql.arff"; //Lokalizacja pliku z danymi
            BasicTools.saveData(data, fileName); //Zapis tablicy do pliku w fromacie ARFF
            BasicTools.processToApriori(data);
            data = BasicTools.loadData(fileName);
            data.setClassIndex(data.numAttributes() - 1);

            String set = "-N " + minRules.getText() + " -C " + minMetric.getText() + " -M " + minSupp;
            String[] options = Utils.splitOptions("-N 10 -C 0.2 -M 0.01");
            Apriori apriori = new Apriori();
            apriori.setOptions(options);
            apriori.buildAssociations(data);



            associationData.setText(apriori.toString());
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }
    }

    void przeladuj() {
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

            Instances data = SQLDataImporter.getDataSetFromPostgreSQL(username, password, query, 0);
            String fileName = "./src/data/from_postgresql.arff"; //Lokalizacja pliku z danymi
            BasicTools.saveData(data, fileName); //Zapis tablicy do pliku w fromacie ARFF
            BasicTools.processToApriori(data);
            data = BasicTools.loadData(fileName);
            data.setClassIndex(data.numAttributes() - 1);

            String s = "-N ";
            StringBuilder sB = new StringBuilder(s);
            sB.append(minRules.getText());
            sB.append(" -C ");
            sB.append(minSupp.getText());
            sB.append(" -M ");
            sB.append(minMetric.getText());

            String[] options = Utils.splitOptions(sB.toString());
            Apriori apriori = new Apriori();
            apriori.setOptions(options);
            apriori.buildAssociations(data);



            associationData.setText(apriori.toString());
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }
    }
}
