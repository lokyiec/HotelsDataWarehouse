package lokyiec.controllers;

import javafx.collections.ObservableList;
import javafx.scene.control.ComboBox;
import lokyiec.dbUtils.CallableStatementParameter;
import lokyiec.sqlData.SQLDataImporter;
import lokyiec.sqlData.BasicTools;
import javafx.collections.FXCollections;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import weka.associations.Apriori;
import weka.associations.AssociationRule;
import weka.associations.AssociationRules;
import weka.associations.Item;
import weka.core.Instances;
import weka.core.Utils;
import java.util.Collection;
import java.util.List;
import java.util.Iterator;
import java.lang.Math.*;

public class ServiceExplorationController {
    CallableStatementParameter cspie = new CallableStatementParameter();
    private ObservableList<String> listaUslug;

    @FXML
    private TextArea associationData;

    @FXML
    private TextField minRules;


    @FXML
    private TextField minSupp;

    @FXML
    private ComboBox<String> comboUslugi;

    @FXML
    void pokaz(ActionEvent event) throws Exception {
        przeladuj();
    }

    // "-N 10 -C 0.2 -M 0.01"

    @FXML
    void initialize() {
        try {
            listaUslug = FXCollections.observableArrayList(cspie.widokListyUslug());
            comboUslugi.setItems(listaUslug);
            comboUslugi.getItems().add("Wszystkie");
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }
    }

    void przeladuj() throws Exception {
        if (minRules.getText().isEmpty() && minSupp.getText().isEmpty()) {
            regulyAsocjacyjne(comboUslugi.getValue(), "10", "0");
        } else if (!minRules.getText().isEmpty() && minSupp.getText().isEmpty()) {
            regulyAsocjacyjne(comboUslugi.getValue(), minRules.getText(),"0");
        } else if (minRules.getText().isEmpty() && !minSupp.getText().isEmpty()) {
            regulyAsocjacyjne(comboUslugi.getValue(), "10", minSupp.getText());
        } else if (!minRules.getText().isEmpty() && !minSupp.getText().isEmpty()) {
            regulyAsocjacyjne(comboUslugi.getValue(), minRules.getText(),minSupp.getText());
        }
    }

    public void regulyAsocjacyjne(String service, String minRules, String minSupp) throws Exception {
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
            String fileName = "./src/main/java/lokyiec/data/Apriori.arff"; //Lokalizacja pliku z danymi
            BasicTools.saveData(data, fileName); //Zapis tablicy do pliku w fromacie ARFF
            BasicTools.processToApriori(data);
            data = BasicTools.loadData(fileName);
            data.setClassIndex(data.numAttributes() - 1);

            String s = "-N ";
            StringBuilder sB = new StringBuilder(s);
            sB.append(minRules);
            sB.append(" -C ");
            sB.append(minSupp);
            String[] options = Utils.splitOptions(sB.toString());

            Apriori apriori = new Apriori();
            apriori.setOptions(options);
            apriori.buildAssociations(data); //Generowanie regul asocjacyjnych

            AssociationRules rules = apriori.getAssociationRules();
            List<AssociationRule> ruleList  = rules.getRules();


            StringBuilder stringBuilder = new StringBuilder();

            for (int i = 0; i < ruleList.size(); i++) {
                AssociationRule rule = ruleList.get(i); //Pobranie pojedynczej reguly

                //Pobranie opisu poprzednika reguly
                Collection<Item> poprzednik = rule.getPremise();
                Iterator<Item> iteratorPoprzednik = poprzednik.iterator();
                String poprzednikText = new String();

                while (iteratorPoprzednik.hasNext()) {
                    poprzednikText = poprzednikText + "("+iteratorPoprzednik.next().toString()+")";
                    if (iteratorPoprzednik.hasNext()) poprzednikText = poprzednikText +"&";
                }

                //Pobranie opisu nastepnika reguly
                Collection<Item> nastepnik = rule.getConsequence();
                Iterator<Item> iteratorNastepnik = nastepnik.iterator();
                String nastepnikText = new String();

                while (iteratorNastepnik.hasNext()) {
                    nastepnikText = nastepnikText + "("+iteratorNastepnik.next().toString()+")";
                    if (iteratorNastepnik.hasNext()) nastepnikText = nastepnikText +"&";
                }


                //Pobranie wsparcie i obliczenia ufnosci
                int wsparciePoprzednika = rule.getPremiseSupport();
                int wsparcieCalosci = rule.getTotalSupport();
                double ufnosc = (double)wsparcieCalosci/wsparciePoprzednika;

                String xd3 = rule.getPremise().toString();
                if(service.toString().equals("Wszystkie")) {
                    stringBuilder.append(poprzednikText);
                    stringBuilder.append("=>");
                    stringBuilder.append(nastepnikText);
                    stringBuilder.append(", ");
                    stringBuilder.append("Wsparcie:");
                    stringBuilder.append(wsparcieCalosci);
                    stringBuilder.append(", ");
                    stringBuilder.append("Ufnosc:");
                    stringBuilder.append(String.format("%.2f", ufnosc));
                    stringBuilder.append("\n");
                }
                if(xd3.equals("[" + service + "=t]")) {
                    stringBuilder.append(poprzednikText);
                    stringBuilder.append("=>");
                    stringBuilder.append(nastepnikText);
                    stringBuilder.append(", ");
                    stringBuilder.append("Wsparcie:");
                    stringBuilder.append(wsparcieCalosci);
                    stringBuilder.append(", ");
                    stringBuilder.append("Ufnosc:");
                    stringBuilder.append(String.format("%.2f", ufnosc));
                    stringBuilder.append("\n");
                }
            }
            associationData.setText(stringBuilder.toString());
        } catch (Exception e) {
            System.out.println("ERROR: " + e.getMessage());
        }
    }
}
