<!DOCTYPE html>
<html>
<%-- WEB-INF/views/order/orderForm.jsp --%>
<head>
<style type="text/css">
  /* omitted (same as previous sample) */
</style>
</head>
<body>
    <form:form modelAttribute="orderForm" method="post"
        class="form-horizontal"
        action="${pageContext.request.contextPath}/order/order">
        <form:label path="coupon" cssErrorClass="error-label">Coupon Code:</form:label>
        <form:input path="coupon" cssErrorClass="error-input" />
        <form:errors path="coupon" cssClass="error-messages" />
        <br>
    <fieldset>
        <legend>Receiver</legend>
        <%-- (1) --%>
        <form:errors path="receiverAddress"
            cssClass="error-messages" />
        <%-- (2) --%>
        <form:label path="receiverAddress.name"
            cssErrorClass="error-label">Name:</form:label>
        <form:input path="receiverAddress.name"
            cssErrorClass="error-input" />
        <form:errors path="receiverAddress.name"
            cssClass="error-messages" />
        <br>
        <form:label path="receiverAddress.postcode"
            cssErrorClass="error-label">Postcode:</form:label>
        <form:input path="receiverAddress.postcode"
            cssErrorClass="error-input" />
        <form:errors path="receiverAddress.postcode"
            cssClass="error-messages" />
        <br>
        <form:label path="receiverAddress.address"
            cssErrorClass="error-label">Address:</form:label>
        <form:input path="receiverAddress.address"
            cssErrorClass="error-input" />
        <form:errors path="receiverAddress.address"
            cssClass="error-messages" />
    </fieldset>
    <br>
    <fieldset>
        <legend>Sender</legend>
        <form:errors path="senderAddress"
            cssClass="error-messages" />
        <form:label path="senderAddress.name"
            cssErrorClass="error-label">Name:</form:label>
        <form:input path="senderAddress.name"
            cssErrorClass="error-input" />
        <form:errors path="senderAddress.name"
            cssClass="error-messages" />
        <br>
        <form:label path="senderAddress.postcode"
            cssErrorClass="error-label">Postcode:</form:label>
        <form:input path="senderAddress.postcode"
            cssErrorClass="error-input" />
        <form:errors path="senderAddress.postcode"
            cssClass="error-messages" />
        <br>
        <form:label path="senderAddress.address"
            cssErrorClass="error-label">Address:</form:label>
        <form:input path="senderAddress.address"
            cssErrorClass="error-input" />
        <form:errors path="senderAddress.address"
            cssClass="error-messages" />
    </fieldset>

        <form:button name="confirm">Confirm</form:button>
    </form:form>
</body>
</html>
<%--
(1)不正な操作により、receiverAddress.name、receiverAddress.postcode、receiverAddress.addressのすべて
がリクエストパラメータとして送信されない場合、receiverAddressがnullとみなされ、この位置にエラーメッセージが表示される。

(2)
子フォームのフィールドは、親フィールド名.子フィールド名で指定する。
--%>
