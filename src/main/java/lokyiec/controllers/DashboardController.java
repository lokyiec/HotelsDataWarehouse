package lokyiec.controllers;

import lokyiec.dialogsUtil.DialogsUtil;
import javafx.application.Platform;
import javafx.event.ActionEvent;
import javafx.scene.control.ButtonType;

import java.util.Optional;

public class DashboardController {
    public static final String RESERVATIONS_FXML = "/fxml/Reservations.fxml";
    public static final String SERVICES_FXML = "/fxml/Services.fxml";
    public static final String CITY_FXML = "/fxml/City.fxml";
    public static final String SERVICESRANKING_FXML = "/fxml/ServicesRanking.fxml";
    public static final String SERVICEESXPLORATION_FXML = "/fxml/ServiceExploration.fxml";
    private MainWindowController mainWindowController;

    public void openReservations(ActionEvent actionEvent) {
        mainWindowController.setCenter(RESERVATIONS_FXML);
    }

    public void openServices(ActionEvent actionEvent) {
        mainWindowController.setCenter(SERVICES_FXML);
    }

    public void openCity(ActionEvent actionEvent) {
        mainWindowController.setCenter(CITY_FXML);
    }

    public void openServiceRanking(ActionEvent actionEvent) {
        mainWindowController.setCenter(SERVICESRANKING_FXML);
    }

    public void openServiceExploration(ActionEvent actionEvent) {
        mainWindowController.setCenter(SERVICEESXPLORATION_FXML);
    }

    public void quit(ActionEvent actionEvent) {
        Optional<ButtonType> resoult = DialogsUtil.dialogConfirm();
        if (resoult.get() == ButtonType.OK) {
            Platform.exit();
            System.exit(0);
        }
    }

    public void setMainWindowController(MainWindowController mainWindowController) {
        this.mainWindowController = mainWindowController;
    }


}
