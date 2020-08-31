<%--
(1)<form:errors>タグのpath属性に、対象のフィールド名を指定する。
この例では、フィールド毎に入力フィールドの横にエラーメッセージを表示する。
エラー時に<label>タグへ加えるクラス名を、cssErrorClass属性で指定する。

(2)エラー時に<input>タグへ加えるクラス名を、cssErrorClass属性で指定する。

(3)エラーメッセージに加えるクラス名を、cssClass属性で指定する。

(4)addressesフィールドに対するエラーメッセージを表示する。

(5)子フォームのコレクションを、<c:forEach>タグを使ってループで処理する。

(6)コレクション中の子フォームのフィールドは、親フィールド名[インデックス].子フィールド名で指定する。
-->
<!DOCTYPE html>
<html>
<%-- WEB-INF/views/user/createForm.jsp --%>
<body>
  <form:form modelAttribute="userForm" method="post"
    class="form-horizontal"
    action="${pageContext.request.contextPath}/user/create">
    <form:label path="name" cssErrorClass="error-label">Name:</form:label><%-- (1) --%>
    <form:input path="name" cssErrorClass="error-input" /><%-- (2) --%>
    <form:errors path="name" cssClass="error-messages" /><%-- (3) --%>
    <br>
    <form:label path="email" cssErrorClass="error-label">Email:</form:label>
    <form:input path="email" cssErrorClass="error-input" />
    <form:errors path="email" cssClass="error-messages" />
    <br>
    <form:label path="age" cssErrorClass="error-label">Age:</form:label>
    <form:input path="age" cssErrorClass="error-input" />
    <form:errors path="age" cssClass="error-messages" />
    <br>
      <form:errors path="addresses" cssClass="error-messages" /><%-- (4) --%>
   <c:forEach items="${userForm.addresses}" varStatus="status"><%-- (5) --%>
       <fieldset class="address">
           <legend>Address${f:h(status.index + 1)}</legend>
           <form:label path="addresses[${status.index}].name"
               cssErrorClass="error-label">Name:</form:label><%-- (6) --%>
           <form:input path="addresses[${status.index}].name"
               cssErrorClass="error-input" />
           <form:errors path="addresses[${status.index}].name"
               cssClass="error-messages" />
           <br>
           <form:label path="addresses[${status.index}].postcode"
               cssErrorClass="error-label">Postcode:</form:label>
           <form:input path="addresses[${status.index}].postcode"
               cssErrorClass="error-input" />
           <form:errors path="addresses[${status.index}].postcode"
               cssClass="error-messages" />
           <br>
           <form:label path="addresses[${status.index}].address"
               cssErrorClass="error-label">Address:</form:label>
           <form:input path="addresses[${status.index}].address"
               cssErrorClass="error-input" />
           <form:errors path="addresses[${status.index}].address"
               cssClass="error-messages" />
           <c:if test="${status.index > 0}">
               <br>
               <button class="remove-address-button">Remove</button>
           </c:if>
       </fieldset>
       <br>
   </c:forEach>
   <button id="add-address-button">Add address</button>
   <br>
    <form:button name="confirm">Confirm</form:button>
  </form:form>
</body>
</html>
