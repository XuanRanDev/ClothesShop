import dev.xuanran.clothesshop.dao.SqlHelper;
import org.junit.jupiter.api.Test;

import java.sql.Connection;

/**
 * Created by XuanRan on 2022/5/23
 */
public class TestSQL {

    @Test
    public void testSQLConnect() {
        Connection connection = SqlHelper.getConnection();
        System.out.println(connection);
    }
}
