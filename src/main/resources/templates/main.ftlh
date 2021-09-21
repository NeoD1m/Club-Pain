<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">


<@c.page>
    <#if !isAdmin>
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
                        <option>ул. Тютчевская аллея, дом 183</option>
                        <option>ул. Власьевский М. пер, дом 64</option>
                        <option>ул. Гончарный 2-й пер, дом 177</option>
                        <option>ул. Зои и Александра Космодемьянских, дом 129</option>
                        <option>ул. Трубниковский пер, дом 27</option>
                        <option>ул. Клары Цеткин, дом 162</option>
                    </select></th>
                <th><select type="text" name="time">
                        <option>11:00</option>
                        <option>11:00</option>
                        <option>12:00</option>
                        <option>13:00</option>
                        <option>14:00</option>
                        <option>15:00</option>
                        <option>16:00</option>
                        <option>17:00</option>
                        <option>18:00</option>
                        <option>19:00</option>
                        <option>20:00</option>
                        <option>21:00</option>
                    </select></th>
                <th><input type="text" name="comment" placeholder="комментарий"></th>
                <th>
                    <button type="submit">готово</button>
                </th></tr>
            </tbody>
        </form>
    </table>

    <!--список
    <form method="get" action="/main">
        <input type="text" name="filter" value="${filter!""}">
        <button type="submit">Найти</button>
    </form>-->
    </#if>
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
        <#list messages as message >
            <#if message.authorName == name || isAdmin == true>
                <#if message.status == "DECLINED"><tr class="table-danger"></#if>
                <#if message.status == "ACCEPTED"><tr class="table-success"></#if>
                <#if message.status == "NOT_REVIEWED"><tr class="table-Default"></#if>

                <th>${message.authorName}</th>
                <th>${message.address}</th>
                <th>${message.time}</th>
                <th>${message.comment}</th>

                    <#if isAdmin && message.status == "NOT_REVIEWED">
                <th><form method="post" action="/main/accept">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button value="${message.id}" name="message" type="submit" class="btn btn-primary">yes</button>
                        </form><th>
                <th> <form method="post" action="/main/decline">
                            <input type="hidden" name="_csrf" value="${_csrf.token}">
                            <button value="${message.id}" name="message" type="submit" class="btn btn-primary">no</button>
                        </form><th>
                    </#if>
                </tr>
            </#if>
        <#else>
            Нет заявок
        </#list>
        </tbody>
    </table>
</@c.page>