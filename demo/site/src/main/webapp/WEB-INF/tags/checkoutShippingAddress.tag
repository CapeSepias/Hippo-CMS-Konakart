<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="hst" uri="http://www.hippoecm.org/jsp/hst/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--@elvariable id="currentCustomer" type="com.konakart.appif.CustomerIf"--%>
<%--@elvariable id="item" type="org.onehippo.forge.konakart.hst.vo.CartItem"--%>


<hst:actionURL var="billing">
    <hst:param name="action" value="SELECT_ADDRESS"/>
    <hst:param name="state" value="SHIPPING_ADDRESS"/>
</hst:actionURL>


<c:if test="${not empty form.message['globalmessage']}">
    <div class="alert alert-error">
            ${form.message['globalmessage']}
    </div>
</c:if>


<form action="${billing}" method="post" class="form-horizontal">

    <div class="alert alert-info">
        Select a billing address from your address book or enter a new address.
    </div>

    <select id="select-address" name="address" class="input-xxlarge">
        <c:forEach items="${addresses}" var="address">
            <option value="${address.id}" <c:if test="${address.id == form.value['address'].value}">selected="selected"</c:if>>
                    ${address.firstName} ${address.lastName}, ${address.streetAddress}, ${address.city}, ${address.postcode} ${address.postcode}, ${address.countryName}
            </option>
        </c:forEach>
        <option value="-1" <c:if test="${-1 == form.value['address'].value}">selected="selected"</c:if>>New address</option>
    </select>

    <br/>
    <br/>
    <div class="well" id="new-address-form">
        <div class="control-group <c:if test="${not empty form.message['gender']}">error</c:if>">
            <label class="control-label required"><fmt:message key="checkout.gender"/></label>

            <div class="controls">
                <label class="radio inline" for="gender-male">
                    <input type="radio" name="gender" class="input-mini" id="gender-male" value="m"
                           <c:if test="${form.value['gender'].value == 'male'}">checked="checked"</c:if>>
                    <fmt:message key="checkout.gender.male"/>
                </label>
                <label class="radio inline" for="gender-female">
                    <input type="radio" name="gender" class="input-mini" id="gender-female" value="f"
                           <c:if test="${form.value['gender'].value == 'female'}">checked="checked"</c:if>>
                    <fmt:message key="checkout.gender.female"/>
                </label>
                <span class="help-inline">${form.message['gender']}</span>
            </div>
        </div>
        <div class="control-group <c:if test="${not empty form.message['firstname']}">error</c:if>">
            <label class="control-label required" for="input01"><fmt:message
                    key="checkout.firstname"/></label>

            <div class="controls">
                <input type="text" class="input-xlarge" id="input01" name="firstname"
                       value="${form.value['firstname'].value}">
                <span class="help-inline">${form.message['firstname']}</span>
            </div>
        </div>
        <div class="control-group <c:if test="${not empty form.message['lastname']}">error</c:if>">
            <label class="control-label required" for="input02"><fmt:message
                    key="checkout.lastname"/></label>

            <div class="controls">
                <input type="text" class="input-xlarge" id="input02" name="lastname"
                       value="${form.value['lastname'].value}">
                <span class="help-inline">${form.message['lastname']}</span>
            </div>
        </div>
        <div class="control-group <c:if test="${not empty form.message['email']}">error</c:if>">
            <label class="control-label required" for="input03"><fmt:message key="checkout.email"/></label>

            <div class="controls">
                <input type="text" class="input-xlarge" id="input03" name="email"
                       value="${form.value['email'].value}">
                <span class="help-inline">${form.message['email']}</span>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="input04"><fmt:message key="checkout.companyName"/></label>

            <div class="controls">
                <input type="text" class="input-xlarge" id="input04" name="companyname"
                       value="${form.value['companyname'].value}">
            </div>
        </div>
        <div class="control-group <c:if test="${not empty form.message['streetaddress']}">error</c:if>">
            <label class="control-label required" for="input05"><fmt:message
                    key="checkout.streetAddress"/></label>

            <div class="controls">
                <input type="text" class="input-xlarge" id="input05" name="streetaddress"
                       value="${form.value['streetaddress'].value}">
                <span class="help-inline">${form.message['streetaddress']}</span>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="input06"><fmt:message key="checkout.suburb"/></label>

            <div class="controls">
                <input type="text" class="input-xlarge" id="input06" name="suburb"
                       value="${form.value['suburb'].value}">
            </div>
        </div>
        <div class="control-group <c:if test="${not empty form.message['postalcode']}">error</c:if>">
            <label class="control-label required" for="input07"><fmt:message
                    key="checkout.postalCode"/></label>

            <div class="controls">
                <input type="text" class="input-xlarge" id="input07" name="postalcode"
                       value="${form.value['postalcode'].value}">
                <span class="help-inline">${form.message['postalcode']}</span>
            </div>
        </div>
        <div class="control-group <c:if test="${not empty form.message['city']}">error</c:if>">
            <label class="control-label required" for="input08"><fmt:message key="checkout.city"/></label>

            <div class="controls">
                <input type="text" class="input-xlarge" id="input08" name="city"
                       value="${form.value['city'].value}">
                <span class="help-inline">${form.message['city']}</span>
            </div>
        </div>
        <div class="control-group <c:if test="${not empty form.message['stateprovince']}">error</c:if>">
            <label class="control-label required" for="StateDropDown"><fmt:message
                    key="checkout.stateProvince"/></label>

            <div class="controls">
                <select name="stateprovince" id="StateDropDown">
                    <option value="-1">---</option>
                    <c:forEach items="${provinces}" var="province">
                        <option value="${province}"
                                <c:if test="${form.value['stateprovince'].value == province}">selected="selected"</c:if>>${province}</option>
                    </c:forEach>
                </select>
                <span class="help-inline">${form.message['stateprovince']}</span>
            </div>
        </div>
        <div class="control-group <c:if test="${not empty form.message['country']}">error</c:if>">
            <label class="control-label required" for="CountryDropDown"><fmt:message
                    key="checkout.country"/></label>

            <div class="controls">
                <select name="country" id="CountryDropDown">
                    <option value="-1">---</option>
                    <c:forEach items="${countries}" var="country">
                        <option value="${country.id}"
                                <c:if test="${form.value['country'].value == country.id}">selected="selected"</c:if>>${country.name}</option>
                    </c:forEach>
                </select>
                <span class="help-inline">${form.message['country']}</span>
            </div>
        </div>
        <div class="control-group <c:if test="${not empty form.message['primarytelephone']}">error</c:if>">
            <label class="control-label required" for="input11"><fmt:message
                    key="checkout.primaryTelephoneNumber"/></label>

            <div class="controls">
                <input type="text" class="input-xlarge" id="input11" name="primarytelephone"
                       value="${form.value['primarytelephone'].value}">
                <span class="help-inline">${form.message['primarytelephone']}</span>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="input12"><fmt:message
                    key="checkout.otherTelephoneNumber"/></label>

            <div class="controls">
                <input type="text" class="input-xlarge" id="input12" name="othertelephone"
                       value="${form.value['othertelephone'].value}">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="input13"><fmt:message key="checkout.faxNumber"/></label>

            <div class="controls">
                <input type="text" class="input-xlarge" id="input13" name="faxnumber"
                       value="${form.value['faxnumber'].value}">
            </div>
        </div>
    </div>
    <br/>
    <input type="submit" class="btn btn-success" value="Continue"/>

</form>
