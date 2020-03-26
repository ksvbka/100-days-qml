import QtQuick 2.0

Item {
    id: root
    width: 375
    height: 812

    Loader {
        id: loader
        anchors.fill: parent
        source: "HomePage.qml"
    }

    PageDrawer {
        id: drawer

        //
        // Icon properties
        //
        iconTitle: "Test App"
        iconSource: "images/logo.svg"
        iconSubtitle: "Version 1.0 Beta"

        //
        // Maps action with item title in listview
        //
        actions: {
            "Home":         function() { loader.source = "HomePage.qml" },
            "Scores Table": function() { loader.source = "ScoreBoardPage.qml" },
            "Charts":       function() { loader.source = "" }, /* NOT IMPLEMENT */
            "LeaderBoard":  function() { loader.source = "" }, /* NOT IMPLEMENT */
            "Settings":     function() { loader.source = "" }, /* NOT IMPLEMENT */
            "Help":         function() { loader.source = "HelpPage.qml" }, /* NOT IMPLEMENT */
            "Report bugs":  function() { loader.source = "" }  /* NOT IMPLEMENT */
        }

        //
        // Define the drawer items
        //
        items: ListModel {
            id: pagesModel

            ListElement {
                pageTitle: "Home"
                pageIcon: "icons/home.png"
            }

            ListElement {
                pageTitle: "Scores Table"
                pageIcon: "icons/score.png"
            }

            ListElement {
                pageTitle: "Charts"
                pageIcon: "icons/chart.png"
            }

            ListElement {
                pageTitle: "LeaderBoard"
                pageIcon: "icons/leaderboard.png"
            }

            ListElement {
                pageTitle: "Settings"
                pageIcon: "icons/settings.png"
            }

            ListElement {
                spacer: true
            }

            ListElement {
                separator: true
            }

            ListElement {
                pageTitle: "Help"
                pageIcon: "icons/help.png"
            }

            ListElement {
                pageTitle: "Report bugs"
                pageIcon: "icons/bug.png"
            }
        }
    }
}