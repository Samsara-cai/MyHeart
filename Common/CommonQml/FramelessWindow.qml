import QtQuick
import QtQuick.Controls

ApplicationWindow{
    id: window
    visible: true
    flags: Qt.FramelessWindowHint
    width: 300
    height: 300
    color: "white"
    property int bw: 3

    function toggleMaximized() {
        if (window.visibility === Window.Maximized) {
            window.showNormal();
        } else {
            window.showMaximized();
        }
    }

    //只是为了改变鼠标形状，不处理任何鼠标事件
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: {
            const p = Qt.point(mouseX, mouseY);
            const b = bw + 10; // Increase the corner size slightly
            if (p.x < b && p.y < b) return Qt.SizeFDiagCursor;
            if (p.x >= width - b && p.y >= height - b) return Qt.SizeFDiagCursor;
            if (p.x >= width - b && p.y < b) return Qt.SizeBDiagCursor;
            if (p.x < b && p.y >= height - b) return Qt.SizeBDiagCursor;
            if (p.x < b || p.x >= width - b) return Qt.SizeHorCursor;
            if (p.y < b || p.y >= height - b) return Qt.SizeVerCursor;
        }

        acceptedButtons: Qt.NoButton
    }

    DragHandler {
        id: resizeHandler
        grabPermissions: TapHandler.TakeOverForbidden
        target: null
        onActiveChanged: if (active) {
                             const p = resizeHandler.centroid.position;
                             const b = bw + 10; // Increase the corner size slightly
                             let e = 0;
                             if (p.x < b) { e |= Qt.LeftEdge }
                             if (p.x >= width - b) { e |= Qt.RightEdge }
                             if (p.y < b) { e |= Qt.TopEdge }
                             if (p.y >= height - b) { e |= Qt.BottomEdge }
                             window.startSystemResize(e);
                         }
    }

    header:ToolBar {
        width: parent.width
        height: 30
        x:0
        y:0
        Item {
            anchors.fill: parent
            TapHandler {
                onTapped: if (tapCount === 2) toggleMaximized()
                gesturePolicy: TapHandler.DragThreshold
            }
            DragHandler {
                grabPermissions: TapHandler.CanTakeOverFromAnything
                onActiveChanged: if (active) { window.startSystemMove(); }
            }

        }

        Text {
            id: authorMsg
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("Author: XinYi Cai. Contact Email: cxy_hfut@163.com.")
        }

        Button {
            id: closeBtn
            width: 35
            height: 35
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter

            onClicked: {

            }
        }

        Button {
            id: minMaxBtn
            width: 35
            height: 35
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                toggleMaximized()
                //TODO::改变图标
            }
        }

        Button {
            id: hideBtn
            width: 35
            height: 35
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                //TODO::最小化
            }
        }
    }
}

