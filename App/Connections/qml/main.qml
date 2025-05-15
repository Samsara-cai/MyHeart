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
        width: 50
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
            icon.source: "qrc:/resources/img/connections.svg"
            icon.width: 30
            icon.height: 30
            icon.color: ( hovered || checked )?"#ffffff" : "#868686"
            checkable:true
            checked:true


            background: Rectangle{
                id:connectionBtnBg
                color: "transparent"
                Rectangle{
                    id:connectionBtnBgleftborder
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: 2
                    color:"#0078d4"
                    visible: connectionBtn.checked
                }
            }

            onCheckedChanged: {
                //TODO: 打开连接的stackView
            }

        }

        ToolButton{
            id:protocalBtn
            anchors.top: connectionBtn.bottom
            anchors.left: parent.left
            width: parent.width
            height: parent.width
            ButtonGroup.group: toolButtonGroup
            icon.source: "qrc:/resources/img/protocal.svg"
            icon.width: 28
            icon.height: 28
            icon.color: ( hovered || checked )?"#ffffff" : "#868686"
            checkable:true
            checked:false


            background: Rectangle{
                id:protocalBtnBg
                color: "transparent"
                Rectangle{
                    id:protocalBtnBgleftborder
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: 2
                    color:"#0078d4"
                    visible: protocalBtn.checked
                }
            }
        }

        ToolButton{
            id: settingBtn
            anchors.left:  parent.left
            anchors.bottom: parent.bottom
            width: parent.width
            height: parent.width
            icon.source: "qrc:/resources/img/settings.svg"
            icon.width: 28
            icon.height: 28
            icon.color: hovered ? "#ffffff" : "#868686"
            background: Rectangle{
                id:settingBtnBg
                color: "transparent"
            }
        }
    }

    Rectangle{
        id: statusBar
        height: 24
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color:"#181818"

    }
}
