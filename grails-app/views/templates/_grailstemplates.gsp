<g:if test="${flash.message}">
    <div class="msg-box successfully">
        <asset:image src="done.png"/>
        <span class="bold-txt"><g:message code="flash.message.success"/></span>
        <p>${flash.message}</p></div>
</g:if>
<g:if test="${flash.messageemail}">
    <div class="msg-box successfully">
        <asset:image src="done.png"/>
        <span class="bold-txt"><g:message code="flash.message.success"/></span>
        <p>${flash.messageemail}</p></div>
</g:if>
<g:if test="${flash.messagesms}">
    <div class="msg-box successfully">
        <asset:image src="done.png"/>
        <span class="bold-txt"><g:message code="flash.message.success"/></span>
        <p>${flash.messagesms}</p></div>
</g:if>
<g:if test="${flash.warn}">
    <div class="msg-box warn">
        <asset:image src="warn.jpg"/>
        <span class="bold-txt">${flash.warn}</span>
    </div>
</g:if>
<g:if test="${flash._warn}">
    <div class="msg-box warn">
        <asset:image src="warn.jpg"/>
        <span class="bold-txt">${flash._warn}</span>
    </div>
</g:if>
<g:if test="${flash.error}">
    <div class="msg-box error">
        <asset:image src="cross.png"/>
        <span class="bold-txt">${flash.error}</span>
    </div>
</g:if>