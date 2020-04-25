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
import lokyiec.dbObjects.ZyskHotel;
import lokyiec.dbObjects.ZyskUslug;
import lokyiec.dbUtils.CallableStatementParameter;

import java.sql.SQLException;

public class ServicesController {
    CallableStatementParameter cspie = new CallableStatementParameter();
    private ObservableList<Hotel> listaHoteli;
    private ObservableList<ZyskUslug> listaZysku;

    @FXML
    private ComboBox<Hotel> comboHotele;

    @FXML
    private TableView<ZyskUslug> tablica;

    @FXML
    private TableColumn<ZyskUslug, Integer> Tmiesiac;

    @FXML
    private TableColumn<ZyskUslug, Integer> Tzysk;

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

        Tmiesiac.setCellValueFactory(new PropertyValueFactory<>("Miesiac"));
        Tzysk.setCellValueFactory(new PropertyValueFactory<>("Zysk"));
    }

    void przeladuj() {
        try {
            listaZysku = FXCollections.observableArrayList(cspie.widokZyskuUslug(comboHotele.getSelectionModel().getSelectedItem().toString()));
        } catch (SQLException e) {
            System.out.println("Problem z wyswietleniem hoteli");
            e.printStackTrace();
        }
        tablica.setItems(listaZysku);
    }

}
