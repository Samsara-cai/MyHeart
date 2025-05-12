#ifndef WINDOWSEVENTFILTER_H
#define WINDOWSEVENTFILTER_H

#include <QObject>
#include <QWindow>

class WindowsEventFilter : public QObject
{
    Q_OBJECT
public:
    explicit WindowsEventFilter(QObject *parent = nullptr);

    /**
     * @brief 事件过滤
     * @param watched
     * @param event
     * @return
     */
    bool eventFilter(QObject *obj, QEvent *event)override;

    void setMainWindow(QWindow* window);

private:
    QWindow* mainWindow;
    bool mainWindowFirstShow = true;
};

#endif // WINDOWSEVENTFILTER_H
