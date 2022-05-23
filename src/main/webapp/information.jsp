<%@ page import="cn.com.scitc.model.Food" %>
<%@ page import="cn.com.scitc.dao.FoodDao" %>

</div>

</div>
</div>
</div>
<script type="text/javascript">
    function validateForm() {
        var text = document.getElementById('text').value;
        if (text <= 0) {
            alert("请正确填写数量！");
            return false;
        }
    }

    function tc() {
        alert('请先登录！！！');
    }

    window.onload = function () {
        var plus = document.getElementById("plus");
        var i = document.getElementById("text").value;
        var subtract = document.getElementById("subtract");
        plus.onclick = function () {
            i++;
            document.getElementById("text").value = i;
        }
        subtract.onclick = function () {
            if (i > 0) {
                i--;
                document.getElementById("text").value = i;
            } else {
                i = 0;
                document.getElementById("text").value = i;
            }
        }
    }
</script>

<script src="/Ordering/jquery/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="/Ordering/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</body>
</html>
