Styling
=======

Styling-Ebenen
--------------

Grundsätzlich erfolg das Styling auf drei Ebenen. Die Basis bildet Uikit, in seiner Rohform, so wie es ausgeliefert wird. Hier werden keine Änderungen vorgenommen. Physikalisch liegen die entsprechenden Dateien unter public/components/uikit/less|js|fonts und werden über Bower bezogen.

Die nächste Schicht bildet das CommSy-Theme, das die Komponentent und Funktionen von UiKit modifiziert und erweitert. Theme steht hier aber für UiKit-Theme und hat noch nichts mit den späteren CommSy-Themes zu tun. Das Theme liegt unter public/css.

Auf oberster Ebene kommt eine normale .css-File hinzu, die das entsprechende CommSy-Theme definiert.

Aufbau
------

Die application.less ist die Basis für alle weiteren Einbindung. Dort wird sowohl die Basis uikit.less geladen, als auch zusätzliche Komponenten und das cs-theme. UiKit besteht grundsätzlich aus einer Vielzahl an Komponenten (Core und Components(erweitert)). Alles im Core ist standartmäßig mitgeladen. Zusätzliche Komponenten müssen manuell hinzugeladen werden, wenn diese benötigt werden.

Alle UiKit-Komponenten (less) sind gleich aufgebaut, wie hier am Beispiel "Panel" aufgezeigt:

1. Es gibt immer eine Basisklasse für die Komponente mit Standartverhalten: "uk-panel"
2. Eine Reihe von Unterobjekten, die in der Komponente genutzt werden können: "uk-panel-title", "uk-panel-badge", "uk-panel-teaser"
3. Eine Reihe von Modifiern, die das Verhalten ändern und aufeinander aufbauen können: "uk-panel-box", "uk-panel-box-primary", "uk-panel-box-primary-hover", ...
4. Benutzungsszenarien: "uk-nav-side"

Naming
------

Alle UiKit-Klassen haben ein Prefix ui-... . Alle CommSy-bezogenen Klassen und Id's sollen den Prefix cs-... bekommen.

Customizing
-----------

Anpassungen an vorhanden UiKit-Komponenten funktionieren so, dass entsprechend der Benamung innerhalb von UiKit (less/components, less/core) eine .less-File innerhalb von cs-theme anlegt. Die Includes laufen über application.less -> cs-theme/uikit.less -> cs-theme/xxx.less. Dort lassen sich Variablen überschreiben, Hooks nutzen, neue Definitionen schreiben, etc.

Anpassung sollen so gut wie möglich an die Struktur von UiKit angelehnt sein und Anpassung so wenig invasiv wie möglich. Dazu können folgende Fragestellungen hilfreich sein:

- Reicht es eine Variable anzupassen?
- Gibt es bereits einen Hook, den ich nutzen kann?
- Halten sich neue Definitionen an die Struktur von UiKit?

Das Styling von komplett neuen Elementen basiert entsprechend auf der Struktur von UiKit.