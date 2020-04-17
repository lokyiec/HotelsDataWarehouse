package lokyiec.controllers;

import lokyiec.fxUtils.FxmlUtils;
import javafx.fxml.FXML;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.Pane;

public class MainWindowController {
    @FXML
    private BorderPane mainWindowBorderPane;

    @FXML
    private DashboardController dashboardController;

    @FXML
    void initialize() {
        this.dashboardController.setMainWindowController(this);
    }

    public void setCenter(String fxmlPath) {
        mainWindowBorderPane.setCenter(FxmlUtils.fxmlLoader(fxmlPath));
    }
}