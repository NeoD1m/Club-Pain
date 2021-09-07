<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
    <div>
        <form method="post">
            <select type="text" name="address">
                <option>ул кукушкина</option>
                <option>ул ПУТИНА</option>
            </select>
            <select type="text" name="time">
                <option>10 00</option>
                <option>11 00</option>
            </select>
            <input type="text" name="comment" placeholder="комментарий">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <button type="submit">готово</button>
        </form>
    </div>
    список
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter!""}">
        <button type="submit">Найти</button>
    </form>
    <#list messages as message>
        <#if message.authorName == name || isAdmin == true>
        <div>
            <b>${message.address}</b>
            <b>${message.time}</b>
            <b>${message.comment}</b>
            <strong>${message.authorName}</strong>
            <b>${message.status}</b>
            <#if isAdmin>
                <form method="get" action="/main">
                <button type="submit">да</button>
                </form>
                <form method="get" action="/main">
                    <button type="submit">нет</button>
                </form>
            </#if>
        </div>
        </#if>
    <#else>
        Нет заявок
    </#list>
</@c.page>