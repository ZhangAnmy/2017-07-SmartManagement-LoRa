//---------------------------------------------------------------------
//
//
//                            ??????????????????????
//
//
//---------------------------------------------------------------------
function GetGridDataID(dataRow) {
    var ObjUnKown = dataRow;
    return ObjUnKown.firstChild.firstChild.value;
}
function GetDataRow(eventElement) {
    while ("BODY" != eventElement.tagName.toUpperCase()) {
        if ("TR" == eventElement.tagName.toUpperCase()) {
            return eventElement;
        }
        eventElement = eventElement.parentElement;
    }
}
function GetGridValue(dataRow, colNumber) {
    return dataRow.cells[colNumber].innerHTML;
}

//----------------------------??????????????????????------------------------------------


//----------------------------------------------------------------
//
//
//			????????????????
//
//
//----------------------------------------------------------------
function DataGridCheck_Click() {
    var checkBox = event.srcElement;
    if (checkBox.type == "checkbox" && checkBox.className != null && checkBox.className == "chkObjID") {
        if (checkBox.checked == true) {
            DataGridItemSelect(checkBox.value);
        } else {
            DataGridItemRemove(checkBox.value);
        }
    }
}
function DataGridItemSelect(objID) {
    var txtIDList = document.getElementById("txtIDList");
    if (null == txtIDList) {
        return;
    }
    if (txtIDList.value.length != 0) {
        var IDs = txtIDList.value.split(",");
        for (var i = 0; i < IDs.length; i++) {
            if (IDs[i] == objID) {
                return;
            }
        }
        txtIDList.value += ",";
    }
    txtIDList.value += objID;
}
function DataGridItemRemove(objID) {
    var txtIDList = document.getElementById("txtIDList");
    if (null == txtIDList) {
        return;
    }
    var IDs = txtIDList.value.split(",");
    var strID = "";
    for (var i = 0; i < IDs.length; i++) {
        if (IDs[i] != objID) {
            if (strID.length != 0) {
                strID += ",";
            }
            strID += IDs[i];
        }
    }
    txtIDList.value = strID;
}
function DataGridItemClear() {
    var txtIDList = document.getElementById("txtIDList");
    if (null == txtIDList) {
        return;
    }
    txtIDList.value = "";
}
function DataGridSelectAll() {
    var objBoxs = document.getElementsByTagName("INPUT");
    var objIDList = document.getElementById("txtIDList");
    objIDList.value = "";
    for (var i = 0; i < objBoxs.length; i++) {
        if (objBoxs[i].type == "checkbox" && objBoxs[i].className == "chkObjID") {
            objBoxs[i].checked = true;
            if (objIDList.value.length != 0) {
                objIDList.value += ",";
            }
            objIDList.value += objBoxs[i].value;
        }
    }
}
function DataGridRemoveAll() {
    var objBoxs = document.getElementsByTagName("INPUT");
    var objIDList = document.getElementById("txtIDList");
    objIDList.value = "";
    for (var i = 0; i < objBoxs.length; i++) {
        if (objBoxs[i].type == "checkbox" && objBoxs[i].className == "chkObjID") {
            objBoxs[i].checked = false;
        }
    }
}
//-----------------????????????????---------------------------------------------------
function FillInput(targetID, value) {
    objTarget = document.getElementById(targetID);
    if (null != objTarget) {
        objTarget.value = value;
    }
}
function ClearInput(targetID) {
    objTarget = document.getElementById(targetID);
    if (null != objTarget) {
        objTarget.value = "";
    }
}
var ActiveElement = false;
function setDate(elementName) {
    ActiveElement = document.getElementById(elementName);
    var w = window.open("../../PubPage/DateSelector.html", "DateSelector", "top=300, left=400, width=280,height=250,resizable=no,scrollbars=no,menu=no,location=no,status=no");
    w.focus();
}
function setDateU(elementName) {
    ActiveElement = document.getElementById(elementName);
    var w = window.open("../PubPage/DateSelector.html", "DateSelector", "top=300, left=400, width=280,height=250,resizable=no,scrollbars=no,menu=no,location=no,status=no");
    w.focus();
}
function GetDateSelectorDate() {
    return ActiveElement.value;
}
function SetDateSelectorDate(dateString) {
    ActiveElement.value = dateString;
}
		
		


//---------------------------??????????-----------------
function BuildDialogUrl(pageUrl) {
    var added = false;
    var cmdName = event.srcElement.CommandName;
    if (cmdName.length > 0) {
        pageUrl += "?cmd=";
        pageUrl += cmdName;
        added = true;
    }
    var cmdArgs = event.srcElement.CommandArgs;
    if (cmdArgs.length > 0) {
        pageUrl += added ? "&" : "?";
        pageUrl += cmdArgs;
    }

//	alert(pageUrl);
    return pageUrl;
}
function ShowDialog(pageUrl) {
    /*
    var myWin = window.open(pageUrl,"DialogWin","left=300, top=260, height=260,width=400,status=yes,toolbar=no,menubar=no,location=no");
    if(null != myWin)
    {
		myWin.focus();
    }
   */
   // document.location.href = pageUrl;
//	window.showModalDialog(pageUrl, "DialogWin","dialogHeight="+height+"px; dialogWidth="+width+"px; status=no; help=no;")
    window.showModalDialog(pageUrl, "DialogWin", "dialogHeight=300px; dialogWidth=400px; status=no; help=no;");
}

//----------------------------??????????---------------------------------
function SetAdminTitle(title) {
    var obj = top.frmPageTool.document.getElementById("tdAdminTitle");
    if (null != obj) {
        obj.innerHTML = title;
    }
}
function ReloadAdminPage() {
    top.frmMain.location.reload();
}

//-------------------------????????????-----------------
function getURLParameter(parameterName) {
    var sURL = window.document.URL.toString();
    if (sURL.indexOf("?") > 0) {
        var arrParams = sURL.split("?");
        var arrURLParams = arrParams[1].split("&");
        var arrParamNames = new Array(arrURLParams.length);
        var arrParamValues = new Array(arrURLParams.length);
        var i = 0;
        for (i = 0; i < arrURLParams.length; i++) {
            var sParam = arrURLParams[i].split("=");
            if (sParam[0] == parameterName) {
                return unescape(sParam[1]);
            }
        }
    }
    return "";
}

//------------------------------------??????????------------------------------
function OpenHtmlEditor(baseUrl, holderID, holderType) {
    var newTop = (screen.availWidth - 640) / 2;
    var newLeft = (screen.availHeight - 480) / 2;
    var pageUrl = baseUrl + "/Admin/controls/htmleditor.aspx?holderID=" + holderID + "&holderType=" + holderType;
//	window.open(pageUrl, "winHtmlEditor","left="+newLeft+",top="+ newTop +",height=480,width=640,status=yes,toolbar=no,menubar=no,location=no"); 
    window.showModalDialog(pageUrl, "winHtmlEditor", "dialogHeight=460px; dialogWidth=640px; status=no; help=no;dialogTop=" + newTop + "px; dialogLeft=" + newLeft + "px;");
}
//----------------------------------------------------------------------------

//------------------------------------??????????????------------------------------
function OpenPictureUploader(baseUrl, holderID, holderType) {
    var newTop = (screen.availWidth - 640) / 2;
    var newLeft = (screen.availHeight - 480) / 2;
    var pageUrl = baseUrl + "/Admin/controls/pictureupload.aspx?holderID=" + holderID + "&holderType=" + holderType;
//	window.open(pageUrl, "winHtmlEditor","left="+newLeft+",top="+ newTop +",height=360,width=480,status=yes,toolbar=no,menubar=no,location=no"); 
    window.showModalDialog(pageUrl, "winPicUpload", "dialogHeight=360px; dialogWidth=480px; status=no; help=no;dialogTop=" + newTop + "px; dialogLeft=" + newLeft + "px;");
}
//----------------------------------------------------------------------------

//Êä³öµ½ExcelÖÐ
function Turn_to_Excel() {
var oXL = new ActiveXObject("Excel.Application"); 
var oWB = oXL.Workbooks.Add(); 
var oSheet = oWB.ActiveSheet; 
var sel=document.body.createTextRange();
sel.moveToElementText(GridView1);
sel.select();
sel.execCommand("Copy");
oSheet.Paste();
oXL.Visible = true;
}

