#ifndef SECONDWINDOW_H
#define SECONDWINDOW_H

#include <QWidget>
#include <QTableWidget>
#include <QMainWindow>

namespace Ui {
class secondwindow;
}

class secondwindow : public QWidget
{
    Q_OBJECT

public:
    explicit secondwindow(QWidget *parent = 0);
    ~secondwindow();

private slots:
    void on_pushButton_3_clicked();
    void on_pushButton_2_clicked();

private:
    Ui::secondwindow *ui;

    QTableWidget * status_table;
};

#endif // SECONDWINDOW_H
