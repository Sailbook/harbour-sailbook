import QtQuick 2.0
import Sailfish.Silica 1.0
import QtWebKit 3.0
import "../js/util.js" as Util

Rectangle {
    anchors { fill: parent }
    color: Util.getBackgroundColor(settings.theme)
    
    Behavior on opacity { FadeAnimation {} }

    property string note: ""
    property bool noProgress: note.length == 0

    Image {
        anchors { fill: parent }
        source: "qrc:///images/icon-cover.svg"
        fillMode: Image.PreserveAspectFit
        opacity: 0.2
        asynchronous: true
    }

    Label {
        anchors {
            bottom: progress.top;
            bottomMargin: Theme.paddingLarge;
            horizontalCenter: parent.horizontalCenter
        }
        font.pixelSize: Theme.fontSizeExtraLarge
        text: note
        color: "red"
        visible: text.length > 0
    }

    BusyIndicator {
        id: progress
        anchors.centerIn: parent
        running: true
        size: BusyIndicatorSize.Large
    }

}
