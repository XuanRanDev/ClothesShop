package dev.xuanran.clothesshop.dao;

import dev.xuanran.clothesshop.model.User;

import java.sql.*;

public class LoginDao {

    public static User validatePassword(User user) {
        String sql = "SELECT * FROM user WHERE loginId=?";
        Connection conn;
        try {
            conn = SqlHelper.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getLoginId());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String password = rs.getString("password");
                if (password.equals(user.getPassword())) {
                    user.setU_id(rs.getInt("u_id"));
                    user.setUserName(rs.getString("userName"));
                    user.setMobile(rs.getString("mobile"));
                    user.setU_flag(rs.getString("u_flag"));
                    user.setEmail(rs.getString("email"));
                    user.setLastOnline(rs.getString("lastOnline"));
                    return user;
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 更新最后上线时间
     *
     * @param user 要更新的用户
     * @return 更新结果
     */
    public static boolean updateLastOnlineTime(User user) {
        Connection con = null;
        String sql = "update user SET lastOnline=? WHERE u_id=?";

        int update = 0;
        try {
            con = SqlHelper.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setDate(1, new Date(System.currentTimeMillis()));
            preparedStatement.setInt(2, user.getU_id());
            update = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return update == 0;
    }

}


