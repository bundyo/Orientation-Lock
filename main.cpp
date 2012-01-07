#include <stdio.h>
#include <signal.h>

#include <QtCore/QCoreApplication>
#include <QProcess>
#include <QFile>

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    QString path = "/home/user/.config/OrientationLock/";
    QString iconFile = path + "current.png";
    QRegExp rx("glol (l|p)");
    QProcess process;
    process.setReadChannel(QProcess::StandardOutput);
    process.setReadChannelMode(QProcess::MergedChannels);
    process.start("ps -Al");

    process.waitForStarted(1000);
    process.waitForFinished(1000);

    QString grep = process.readAll();

    process.start("killall glol");
    process.waitForStarted(1000);
    process.waitForFinished(1000);
    process.startDetached("rm -f " + iconFile);

    if (rx.indexIn(grep) == -1) {
        process.startDetached("cp -f " + path + "locked_portrait.png " + iconFile);
        process.startDetached("glol", QStringList("p"));
    } else {
        if (rx.cap(1) == "p") {
            process.startDetached("cp -f " + path + "locked_landscape.png " + iconFile);
            process.startDetached("glol", QStringList("l"));
        } else {
            process.startDetached("cp -f " + path + "unlocked.png " + iconFile);
        }
    }

    return 0;
}
