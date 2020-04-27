package lokyiec.controllers;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ComboBox;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import lokyiec.dbObjects.topCity;
import lokyiec.dbUtils.CallableStatementParameter;

import java.sql.SQLException;

public class CityController {
    CallableStatementParameter cspie = new CallableStatementParameter();
    private ObservableList<topCity> topMiast;

    @FXML
    private TextField ilosc;

    @FXML
    private TableView<topCity> tablica;

    @FXML
    private TableColumn<topCity, String> Tmiasto;

    @FXML
    private TableColumn<topCity, Integer> Tilosc;

    @FXML
    void pokaz(ActionEvent event) {
        przeladuj();
    }

    @FXML
    void initialize() {
        try {
            topMiast = FXCollections.observableArrayList(cspie.widokMiast(10));
        } catch (SQLException e) {
            System.out.println("Problem z wyswietleniem hoteli");
            e.printStackTrace();
        }

        Tmiasto.setCellValueFactory(new PropertyValueFactory<>("adres_miasto"));
        Tilosc.setCellValueFactory(new PropertyValueFactory<>("Ilosc"));
    }

    void przeladuj() {
        try {
            topMiast = FXCollections.observableArrayList(cspie.widokMiast(Integer.parseInt(ilosc.getText())));
        } catch (SQLException e) {
            System.out.println("Problem z wyswietleniem hoteli");
            e.printStackTrace();
        }
        tablica.setItems(topMiast);
    }
}
