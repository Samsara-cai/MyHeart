import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Page {
    width: 640
    height: 480
    clip:true

    background: Rectangle{
        color:"red"
    }

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            id: head
            Layout.preferredHeight: 36
            width: parent.width
            color: "#181818"
            Text {
                width: parent.width
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                id: name
                text: qsTr("连接管理")
                color: "white"
            }
        }

        Rectangle {
            Layout.fillHeight: true
            width: parent.width
            color: "red"
            ListView {
                id: connectionsListView
                width: parent.width
                height: parent.height
                model: 10
                delegate: Text {
                    width: ListView.width
                    text: "Item " + index
                    color: "white"
                }
            }
        }

        Rectangle {
            id: foot
            Layout.preferredHeight: 30
            width: parent.width
            color: "#181818"
            ToolButton {
                anchors.horizontalCenter: parent.horizontalCenter
                id: addBtn
                width: parent.width
                height: 28
                background: Rectangle {
                    color: "#0078d4"
                    radius: 5
                }
                text: qsTr("新增连接")
            }
        }
    }
}
