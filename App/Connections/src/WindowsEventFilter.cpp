#include "WindowsEventFilter.h"
#include <QEvent>
#include <QDebug>


WindowsEventFilter::WindowsEventFilter(QObject *parent)
{
    mainWindow = nullptr;
}

bool WindowsEventFilter::eventFilter(QObject *obj, QEvent *event)
{
    return QObject::eventFilter(obj, event);
}

void WindowsEventFilter::setMainWindow(QWindow *window)
{
    this->mainWindow = window;
}
