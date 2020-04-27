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
import lokyiec.dbObjects.ZyskUslug;
import lokyiec.dbUtils.CallableStatementParameter;

import java.sql.SQLException;

public class ServicesRankingController {
    CallableStatementParameter cspie = new CallableStatementParameter();
    private ObservableList<Hotel> listaHoteli;
    private ObservableList<Usluga> listaUslug;

    @FXML
    private ComboBox<Hotel> comboHotele;

    @FXML
    private TableView<Usluga> tablica;

    @FXML
    private TableColumn<Usluga, String> Tusluga;

    @FXML
    private TableColumn<Usluga, Integer> Tilosc;

    @FXML
    void pokaz(ActionEvent event) {
        przeladuj();
    }

    @FXML
    void initialize() {
        try {
            listaHoteli = FXCollections.observableArrayList(cspie.widokHoteli());
        } catch (SQLException e) {
            System.out.println("Problem z wyswietleniem hoteli");
            e.printStackTrace();
        }
        comboHotele.setItems(listaHoteli);

        Tusluga.setCellValueFactory(new PropertyValueFactory<>("usluga_nazwa"));
        Tilosc.setCellValueFactory(new PropertyValueFactory<>("ilosc"));
    }

    void przeladuj() {
        try {
            listaUslug = FXCollections.observableArrayList(cspie.widokUslug(comboHotele.getSelectionModel().getSelectedItem().toString()));
        } catch (SQLException e) {
            System.out.println("Problem z wyswietleniem hoteli");
            e.printStackTrace();
        }
        tablica.setItems(listaUslug);
    }
}
