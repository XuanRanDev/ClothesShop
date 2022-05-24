import dev.xuanran.clothesshop.dao.LoginDao;
import dev.xuanran.clothesshop.dao.SqlHelper;
import dev.xuanran.clothesshop.dao.UserDao;
import dev.xuanran.clothesshop.model.User;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.Date;

/**
 * Created by XuanRan on 2022/5/23
 */
public class TestSQL {

    @Test
    public void testSQLConnect() {
        Connection connection = SqlHelper.getConnection();
        System.out.println(connection);
    }

    @Test
    public void testUpdateSQL() {
        User user = UserDao.searchById(2);
        System.out.println(user);
        LoginDao.updateLastOnlineTime(user);
    }

    @Test
    public void testDate() {
        System.out.println(new Date(System.currentTimeMillis()));
    }

}
