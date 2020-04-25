package lokyiec.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.text.Text;
import java.sql.SQLException;
import java.util.Optional;
import lokyiec.dbObjects.Hotel;
import lokyiec.dbObjects.ZyskHotel;
import lokyiec.dbUtils.CallableStatementParameter;

public class ReservationsController {
    CallableStatementParameter cspie = new CallableStatementParameter();
    private ObservableList<Hotel> listaHoteli;
    private ObservableList<ZyskHotel> listaZysku;

    @FXML
    private ComboBox<Hotel> comboHotele;

    @FXML
    private TableView<ZyskHotel> tablica;

    @FXML
    private TableColumn<ZyskHotel, Integer> Tmiesiac;

    @FXML
    private TableColumn<ZyskHotel, Integer> Tzysk;

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
            listaZysku = FXCollections.observableArrayList(cspie.widokZyskuHotelu(comboHotele.getSelectionModel().getSelectedItem().toString()));
        } catch (SQLException e) {
            System.out.println("Problem z wyswietleniem hoteli");
            e.printStackTrace();
        }
        tablica.setItems(listaZysku);
    }

}

