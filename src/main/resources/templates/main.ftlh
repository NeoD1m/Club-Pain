<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">


<@c.page>
    <table>
        <thead>
        <tr>
            <th>адрес</th>
            <th>время</th>
            <th>комментарий</th>
        </tr>

        </thead>

        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}">
            <tbody>
            <tr><th><select type="text" name="address">
                    <option>ул кукушкина</option>
                    <option>ул ПУТИНА</option>
                </select></th>
            <th><select type="text" name="time">
                    <option>10 00</option>
                    <option>11 00</option>
                </select></th>
            <th><input type="text" name="comment" placeholder="комментарий"></th>
            <th>
                <button type="submit">готово</button>
            </th></tr>
            </tbody>
        </form>
    </table>

    список
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter!""}">
        <button type="submit">Найти</button>
    </form>
    <table class="table">
        <thead>
        <tr>
            <th>имя</th>
            <th>адрес</th>
            <th>время</th>
            <th>комментарий</th>
        </tr>
        </thead>
    <tbody>
    <#list messages as message>
        <#if message.authorName == name || isAdmin == true>
                <#if message.status == "DECLINED"><tr class="table-danger"></#if>
                <#if message.status == "ACCEPTED"><tr class="table-success"></#if>
                <#if message.status == "NOT_REVIEWED"><tr class="table-Default"></#if>

                <th>${message.authorName}</th>
                <th>${message.address}</th>
                <th>${message.time}</th>
                <th>${message.comment}</th>
                    <th>
                <#if isAdmin && message.status == "NOT_REVIEWED">
                    <form action="/accept" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="hidden" name="message" value="${message}"></form>
                        <input type="submit" name="yes" value="accept"></form>
                </#if></th>
                </tr>
            </#if>
    <#else>
        Нет заявок
    </#list>
    </tbody>
    </table>
</@c.page>