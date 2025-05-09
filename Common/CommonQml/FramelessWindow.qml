import QtQuick
import QtQuick.Controls

ApplicationWindow{
    id: window
    visible: true
    flags: Qt.FramelessWindowHint | Qt.Window
    minimumWidth: 1200
    minimumHeight: 800
    color: "#1f1f1f"
    property int bw: 10

    function toggleMaximized() {
        if (window.visibility === Window.Maximized) {
            window.showNormal();
        } else {
            window.showMaximized();
        }
    }



    ToolBar {
        width: parent.width
        height: 42
        leftPadding: 0
        rightPadding: 0
        x:0
        y:0

        background: Rectangle {
            border.width: 0
            anchors.fill: parent
            color: "#181818"   // 设置你想要的颜色
        }

        Item {
            anchors.fill: parent
            TapHandler {
                onTapped: if (tapCount === 2) toggleMaximized()
                gesturePolicy: TapHandler.DragThreshold
            }
            DragHandler {
                id: moveHandler
                grabPermissions: DragHandler.TakeOverForbidden
                onActiveChanged: if (active) { window.startSystemMove(); }
            }

        }

        Image {
            id: appLogo
            anchors.left: parent.left
            width: 42
            height: 42
        }


        ToolButton {
            id: closeBtn
            width: 42
            height: 42
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            onClicked: window.close()

            icon.source: "qrc:/qt/qml/CommonQml/img/close.svg"

            background: Rectangle {
                anchors.fill: parent
                color: closeBtn.hovered ? "#e81123" : "transparent"
            }
        }

        ToolButton {
            id: maxBtn
            width: 42
            height: 42
            anchors.right: closeBtn.left
            anchors.verticalCenter: parent.verticalCenter
            onClicked: {
                toggleMaximized()
            }

            icon.source: window.visibility === Window.Maximized ?
                         "qrc:/qt/qml/CommonQml/img/normalize.svg" :
                         "qrc:/qt/qml/CommonQml/img/maxmize.svg"

            background: Rectangle {
                anchors.fill: parent
                color: maxBtn.hovered ? "#373737" : "transparent"
            }

            // 自动更新图标（绑定）
            Component.onCompleted: window.visibilityChanged.connect(() => maxBtn.forceActiveFocus())
        }

        ToolButton {
            id: minBtn
            width: 42
            height: 42
            anchors.right: maxBtn.left
            anchors.verticalCenter: parent.verticalCenter
            onClicked: window.showMinimized()

            icon.source: "qrc:/qt/qml/CommonQml/img/minimize.svg"

            background: Rectangle {
                anchors.fill: parent
                color: minBtn.hovered ? "#373737" : "transparent"
            }
        }

    }

    //改变鼠标形状，不处理任何鼠标事件
    MouseArea {
        id: mainArea
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: {

            function isInItem(item) {
                const localPos = item.mapFromItem(mainArea, mouseX, mouseY);
                return item.contains(localPos);
            }

            // 如果鼠标在标题栏按钮上，不处理
            if (isInItem(closeBtn) || isInItem(maxBtn) || isInItem(minBtn)) {
                moveHandler.enabled = false;
                resizeHandler.enabled = false;
                return Qt.ArrowCursor;
            }


            if (window.visibility === Window.Maximized) {
                //最大化只允许拖动
                moveHandler.enabled = true;
                resizeHandler.enabled = false;
                return Qt.ArrowCursor;
            }

            const p = Qt.point(mouseX, mouseY);
            const b = bw ;
            if (p.x < b && p.y < b){ return Qt.SizeFDiagCursor;}
            else if (p.x >= width - b && p.y >= height - b){
                moveHandler.enabled = false;
                resizeHandler.enabled = true;
                return Qt.SizeFDiagCursor;
            }
            else if (p.x >= width - b && p.y < b){
                moveHandler.enabled = false;
                resizeHandler.enabled = true;
                return Qt.SizeBDiagCursor;
            }
            else if (p.x < b && p.y >= height - b){
                moveHandler.enabled = false;
                resizeHandler.enabled = true;
                return Qt.SizeBDiagCursor;
            }
            else if (p.x < b || p.x >= width - b) {
                moveHandler.enabled = false;
                resizeHandler.enabled = true;
                return Qt.SizeHorCursor;
            }
            else if (p.y < b || p.y >= height - b) {
                moveHandler.enabled = false;
                resizeHandler.enabled = true;
                return Qt.SizeVerCursor;
            }
            else{
                moveHandler.enabled = true;
                resizeHandler.enabled = false;
                return Qt.ArrowCursor;
            }
        }
        acceptedButtons: Qt.NoButton
    }

    DragHandler {
        id: resizeHandler
        grabPermissions: DragHandler.CanTakeOverFromItems
        target: null
        dragThreshold: 3
        onActiveChanged: if (active) {
                             const p = resizeHandler.centroid.position;
                             const b = bw; // Increase the corner size slightly
                             let e = 0;
                             if (p.x < b) { e |= Qt.LeftEdge }
                             if (p.x >= width - b) { e |= Qt.RightEdge }
                             if (p.y < b) { e |= Qt.TopEdge }
                             if (p.y >= height - b) { e |= Qt.BottomEdge }
                             if(e!=0)
                                 window.startSystemResize(e);
                         }
    }

}

