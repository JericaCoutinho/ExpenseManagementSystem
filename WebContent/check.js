function select(cusName,finName) {
	var customerName = cusName;
    var financierName = finName;
    if (customerName == '' || financierName == '') {
        alert('Please login to continue.');
        return false;
    }

    var xmlhttp;
    if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else { // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.open("POST", "CustomerSelectFinancier?customerName=" + customerName + "&financierName=" + financierName, true);

    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        	window.alert(xmlhttp.responseText);
        	/*
            if (xmlhttp.responseText.indexOf('Already') !== -1) {
               // document.getElementById("loading-icon").innerHTML = "<h4 style='color:red'>" + xmlhttp.responseText + "<h4>";
                window.alert(xmlhttp.responseText);
            	//window.alert('<a href="startchat.jsp">Enter the Chat Room</a>');
            	// window.open("startchat.jsp");
            	
            } else {
                //document.getElementById("result-data").innerHTML = '<h1>' + xmlhttp.responseText + '</h1>';
               // window.alert(xmlhttp.responseText);
                window.open("startchat.jsp");
            }
            */
        }
    }
    xmlhttp.send(null);

}

function startchatting(sndName,rcvName) {
	var senderName = sndName;
    var receiverName = rcvName;
    if (senderName == '' || receiverName == '') {
        alert('Please login to continue.');
        return false;
    }

    var xmlhttp;
    if (window.XMLHttpRequest) { // code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    } else { // code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.open("POST", "chat?senderName=" + senderName + "&receiverName=" + receiverName, true);

 //   document.getElementById("loading-icon").innerHTML = '<img src="loader.gif" border="0" alt="Loading, please wait..." />';
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            if (xmlhttp.responseText.indexOf('Incorrect') !== -1) {
               // document.getElementById("loading-icon").innerHTML = "<h4 style='color:red'>" + xmlhttp.responseText + "<h4>";
                window.alert(xmlhttp.responseText);
            	//window.alert('<a href="startchat.jsp">Enter the Chat Room</a>');
            	// window.open("startchat.jsp");
            	
            } else {
                //document.getElementById("result-data").innerHTML = '<h1>' + xmlhttp.responseText + '</h1>';
               // window.alert(xmlhttp.responseText);
                window.open("startchat.jsp");
            }


        }


    }
    xmlhttp.send(null);

}

function addText()
{
    var username = document.getElementById('u').value;
    var msg = document.getElementById('h').value;
    olist = document.getElementById('list'); 
    op = document.createElement('p'); 
    op.innerHTML = username + "- <g>" + msg + "</g>";
    ocontent = document.getElementById('content');   
    ocontent.appendChild(op);             //Add new line on click
    olist.scrollTop = olist.scrollHeight; //Adjust Height 
    document.getElementById('h').value = '';
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.open("POST", "chatstore?uname=" + username + "&msg=" + msg, true);

    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById("result").innerHTML = 'sent';
            document.getElementById("result").innerHTML = '';
        }
    }
    xmlhttp.send(null);
}

function reloaddata()
{
    var xmlhttp;
    if (window.XMLHttpRequest)
    {// code for IE7+, Firefox, Chrome, Opera, Safari
        xmlhttp = new XMLHttpRequest();
    }
    else
    {// code for IE6, IE5
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    
    xmlhttp.open("POST", "reloaddata", true);
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
        {
            document.getElementById("content").innerHTML = xmlhttp.responseText;
            olist = document.getElementById('list'); //everything in id list
            olist.scrollTop = olist.scrollHeight;
        }
    }
    xmlhttp.send(null);
}

