#include <stdio.h>
#include <signal.h>

#include <QtCore/QCoreApplication>
#include <QProcess>
#include <QFile>
#include <MNotification>

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    QString path = "/home/user/.config/OrientationLock/";
    QString srcPath = "/opt/orientationlock/icons/";
    QString iconFile = path + "current.png";
    QRegExp rx("glol (l|p)");
    QProcess process;
    process.setReadChannel(QProcess::StandardOutput);
    process.setReadChannelMode(QProcess::MergedChannels);
    process.start("ps -Al");

    process.waitForStarted(1000);
    process.waitForFinished(1000);

    QString grep = process.readAll();

    MNotification *banner = new MNotification(MNotification::DeviceEvent);
    banner->setImage("icon-l-settings");

    process.start("killall glol");
    process.waitForStarted(1000);
    process.waitForFinished(1000);
    process.startDetached("rm -f " + iconFile);

    if (rx.indexIn(grep) == -1) {
        process.startDetached("cp -f " + srcPath + "locked_portrait.png " + iconFile);
        process.startDetached("glol", QStringList("p"));
        banner->setBody("Orientation locked to Portrait");
    } else {
        if (rx.cap(1) == "p") {
            process.startDetached("cp -f " + srcPath + "locked_landscape.png " + iconFile);
            process.startDetached("glol", QStringList("l"));
            banner->setBody("Orientation locked to Landscape");
        } else {
            process.startDetached("cp -f " + srcPath + "unlocked.png " + iconFile);
            banner->setBody("Orientation unlocked");
        }
    }
    banner->publish();

    return 0;
}
