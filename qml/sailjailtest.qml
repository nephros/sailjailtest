import QtQuick 2.6
import Sailfish.Silica 1.0
import QtQuick.LocalStorage 2.0

ApplicationWindow {
    id: app

    cover:  Component { CoverPlaceholder { text: Qt.application.name } }
    initialPage: Component { Page { id: page
        ListModel { id: pathsModel
            Component.onCompleted: {
                //append( { "name": "Application",   "path": Qt.application.name });
                //append( { "name": "Organization",  "path": Qt.application.organization });
                append( { "name": "Temporary",     "path": StandardPaths.temporary.toString()});
                append( { "name": "Cache",         "path": StandardPaths.cache.toString()});
                append( { "name": "GenericData",   "path": StandardPaths.genericData.toString()});
                append( { "name": "Data",          "path": StandardPaths.data.toString()});
                append( { "name": "Home",          "path": StandardPaths.home.toString()});
                append( { "name": "Documents",     "path": StandardPaths.documents.toString()});
                append( { "name": "Download",      "path": StandardPaths.download.toString()});
                append( { "name": "Music",         "path": StandardPaths.music.toString()});
                append( { "name": "Pictures",      "path": StandardPaths.pictures.toString()});
                append( { "name": "Videos",        "path": StandardPaths.videos.toString()});
            }
            function reload() {
                clear();
                //append( { "name": "Application",   "path": Qt.application.name });
                //append( { "name": "Organization",  "path": Qt.application.organization });
                append( { "name": "Temporary",     "path": StandardPaths.temporary.toString()});
                append( { "name": "Cache",         "path": StandardPaths.cache.toString()});
                append( { "name": "GenericData",   "path": StandardPaths.genericData.toString()});
                append( { "name": "Data",          "path": StandardPaths.data.toString()});
                append( { "name": "Home",          "path": StandardPaths.home.toString()});
                append( { "name": "Documents",     "path": StandardPaths.documents.toString()});
                append( { "name": "Download",      "path": StandardPaths.download.toString()});
                append( { "name": "Music",         "path": StandardPaths.music.toString()});
                append( { "name": "Pictures",      "path": StandardPaths.pictures.toString()});
                append( { "name": "Videos",        "path": StandardPaths.videos.toString()});
            }
        }
        SilicaFlickable {
            anchors { fill: parent; horizontalCenter: parent.horizontalCenter; }
            PageHeader { id: header; title: Qt.application.name; description: Qt.application.organization + "/" + Qt.application.name }

            ColumnView { id: view
                anchors { top: header.bottom; horizontalCenter: parent.horizontalCenter; }
                width: parent.width
                itemHeight: Theme.itemSizeSmall
                model: pathsModel

                delegate: Component { DetailItem {
                    width: parent.width
                    label: name; value: path
                }}
            }
            Button{ id: button
                anchors { top: view.bottom; horizontalCenter: parent.horizontalCenter; }
                text: "Set Orga and App names"
                onClicked: {
                    Qt.application.organization = "OraNameFromQML";
                    Qt.application.name  = "AppNameFromQML";
                    pathsModel.reload();
                }
            }
            Label { id: label
                anchors { top: button.bottom; horizontalCenter: parent.horizontalCenter; }
                width: page.width - Theme.horizontalPageMargin
                horizontalAlignment: Text.AlignHCenter
                text: "See the console log for more paths."
                wrapMode: Text.Wrap
            }
        }
    }}
    Component.onCompleted: {
        var db = LocalStorage.openDatabaseSync(
            "SailJailTest",
            "",
            "SailJail Test",
            1024,
            function(e) {
                console.info("Database does not yet exist.");
            }
        );
        console.info("LocalStorage DB info: " + JSON.stringify(db, null, 4));
    }
}

// vim: ft=javascript expandtab ts=4 sw=4 st=4
