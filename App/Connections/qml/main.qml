import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import CommonQml 1.0
import Connections

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

            // @disable-check M300
            BubbleToolTip{
                id:connectionBtnTip
                x:parent.width
                y:(parent.height - height) / 2
                currentPosition: BubbleToolTip.ToolTipPositionEnum.LEFT
                delay:1000
                timeout: 5000
                tipText: qsTr("连接管理")
                visible:connectionBtn.hovered
            }

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
               if(checked)
                    controlStack.currentIndex = 0
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

            // @disable-check M300
            BubbleToolTip{
                id:protocalBtnTip
                x:parent.width
                y:(parent.height - height) / 2
                currentPosition: BubbleToolTip.ToolTipPositionEnum.LEFT
                delay:1000
                timeout: 5000
                tipText: qsTr("协议管理")
                visible:protocalBtn.hovered
            }

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
            onCheckedChanged: {
               if(checked)
                    controlStack.currentIndex = 1
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

            // @disable-check M300
            BubbleToolTip{
                id:settingBtnTip
                x:parent.width
                y:(parent.height - height) / 2
                currentPosition: BubbleToolTip.ToolTipPositionEnum.LEFT
                delay:1000
                timeout: 5000
                tipText: qsTr("设置")
                visible:settingBtn.hovered
            }

            background: Rectangle{
                id:settingBtnBg
                color: "transparent"
            }
        }
    }

    SplitView {
        id:mainView
        anchors.left: mainTool.right
        anchors.leftMargin: 1
        anchors.bottom: statusBar.top
        anchors.bottomMargin: 1
        anchors.top: windowTitle.bottom
        anchors.topMargin: 1
        anchors.right: parent.right
        orientation: Qt.Vertical
        spacing: 1
        handle: Rectangle {
                 id: verticalHandleDelegate
                 implicitWidth: 2
                 implicitHeight: 2
                 color: SplitHandle.pressed ? "#0078d4"
                     : (SplitHandle.hovered ? Qt.lighter("#0078d4", 1.1) : "#1f1f1f")
             }

        SplitView{
            id: controlView
            orientation: Qt.Horizontal
            SplitView.fillHeight: true
            SplitView.minimumHeight: 120
            handle: Rectangle {
                     id: horitalHandleDelegate
                     implicitWidth: 2
                     implicitHeight: 2
                     color: SplitHandle.pressed ? "#0078d4"
                         : (SplitHandle.hovered ? Qt.lighter("#0078d4", 1.1) : "#1f1f1f")
                 }



            StackLayout{
                id: controlStack
                currentIndex: 0
                SplitView.preferredWidth:  250

                Loader{
                    source: "connectionCtrlUI.qml"
                }


            }

            Rectangle{
                id: showArea
                color: "transparent"
                SplitView.minimumWidth: 300
            }
        }

        Rectangle{
            //输出视图
            id: outPutView
            color: "#181818"
            SplitView.preferredHeight: 150  // 初始高度
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
