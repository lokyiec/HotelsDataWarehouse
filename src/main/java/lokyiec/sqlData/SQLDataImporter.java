package lokyiec.sqlData;

import weka.core.Instances;
import weka.experiment.InstanceQuery;
import java.io.File;

public class SQLDataImporter {
    static File propsFile = new File("./src/main/java/lokyiec/settings/DatabaseUtils.props");

    public static Instances getDataSetFromPostgreSQL(String userName, String password, String queryText, int limit) throws Exception {
        InstanceQuery query = new InstanceQuery();
        query.setUsername(userName);
        query.setPassword(password);

        // plik ustawien polaczenia z baza danych
        query.setCustomPropsFile(propsFile);

        if (limit>0) query.setQuery(queryText + " limit "+ limit + ";");
        else query.setQuery(queryText + ";");

        Instances data = query.retrieveInstances();

        return data;
    }
}