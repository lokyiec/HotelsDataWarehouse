package lokyiec.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import lokyiec.dbObjects.Hotel;
import lokyiec.dbObjects.Usluga;
import lokyiec.dbObjects.topUslug;
import lokyiec.dbUtils.CallableStatementParameter;

import java.sql.SQLException;

public class ServicesRankingController {
    CallableStatementParameter cspie = new CallableStatementParameter();
    private ObservableList<topUslug> topUslug;
    private ObservableList<String> listaUslug;

    @FXML
    private ComboBox<String> comboUslugi;

    @FXML
    private TableView<topUslug> tablica;

    @FXML
    private TableColumn<topUslug, String> Tusluga;

    @FXML
    private TableColumn<topUslug, Integer> Tmercury;

    @FXML
    private TableColumn<topUslug, Integer> Tvenus;

    @FXML
    private TableColumn<topUslug, Integer> Tmars;

    @FXML
    private TableColumn<topUslug, Integer> Tjupiter;

    @FXML
    private TableColumn<topUslug, Integer> Tsaturn;

    @FXML
    private TableColumn<topUslug, Integer> Trazem;

    @FXML
    void pokaz(ActionEvent event) {
        przeladuj();
    }

    @FXML
    void initialize() {
        try {
            listaUslug = FXCollections.observableArrayList(cspie.widokListyUslug());
            topUslug = FXCollections.observableArrayList(cspie.widokUslug("Wszystkie"));
        } catch (SQLException e) {
            System.out.println("Problem z wyswietleniem hoteli");
            e.printStackTrace();
        }
        comboUslugi.setItems(listaUslug);
        comboUslugi.getItems().add("Wszystkie");

        Tusluga.setCellValueFactory(new PropertyValueFactory<>("uslug_nazwa"));
        Tmercury.setCellValueFactory(new PropertyValueFactory<>("mercury"));
        Tvenus.setCellValueFactory(new PropertyValueFactory<>("venus"));
        Tmars.setCellValueFactory(new PropertyValueFactory<>("mars"));
        Tjupiter.setCellValueFactory(new PropertyValueFactory<>("jupiter"));
        Tsaturn.setCellValueFactory(new PropertyValueFactory<>("saturn"));
        Trazem.setCellValueFactory(new PropertyValueFactory<>("razem"));
        tablica.setItems(topUslug);
    }

    void przeladuj() {
        try {
            topUslug = FXCollections.observableArrayList(cspie.widokUslug(comboUslugi.getValue()));
        } catch (SQLException e) {
            System.out.println("Problem z wyswietleniem hoteli");
            e.printStackTrace();
        }
        tablica.setItems(topUslug);
    }
}
