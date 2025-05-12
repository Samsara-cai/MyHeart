import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import CommonQml 1.0

FramelessWindow{
    id: mainWindow
    logoSources: "qrc:/resources/img/app.ico"



    Rectangle{
        id:mainTool
        anchors.left: parent.left
        anchors.top: windowTitle.bottom
        anchors.topMargin: 1
        anchors.bottom: statusBar.top
        anchors.bottomMargin: 1
        width: 60
        color:"#181818"

        ButtonGroup{
            id:toolButtonGroup
            exclusive: true;
        }

        ToolButton{
            id:connectionBtn
            anchors.top: parent.top
            anchors.left: parent.left
            width: parent.width
            height: parent.width
            ButtonGroup.group: toolButtonGroup

            background: Rectangle{
                id:connectionBtnBg
                color: "transparent"

                Rectangle{
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: 1
                    color:"#0078d4"
                    visible: connectionBtn.checked
                }
            }

            onCheckedChanged: {
                console.log("nmsl")
            }
        }

        ToolButton{
            id:protocalBtn
            anchors.top: connectionBtn.bottom
            anchors.left: parent.left
            width: parent.width
            height: parent.width
            ButtonGroup.group: toolButtonGroup
            background: Rectangle{
                id:protocalBtnBg
                color: "transparent"
            }

            onHoveredChanged: {
                if(hovered)
                {
                    icon.color = "white";
                }else{
                    icon.color = "white";
                }
            }

            onCheckedChanged: {
                if(checked){

                }else{

                }
            }
        }

    }

    Rectangle{
        id: statusBar
        height: 28
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color:"#181818"

    }
}
