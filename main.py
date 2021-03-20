from os import access as file_exists
from os import F_OK as file_exists_param
from os import system as cmd_run
from sys import exit as exit_
from win32gui import GetForegroundWindow as GetCurrentWindow
from win32gui import GetWindowText as GetText
from win32gui import EnumWindows as WindowsHandler
from PyQt5 import QtWidgets as Widgets
from PyQt5.QtWidgets import QMessageBox as MessageBox
from ui import Ui_MainWindow as NewMainWindow
from clear_cache import clear as clear_cache
from threading import Thread as NewThread
from time import sleep as time_sleep
from os import startfile as run_program


running = True
csgo_launched = False
scripts = {
    'bunny_hop_running': False,
    'bunny_hop_started': False,
    'cross_hair_running': False
}


def enum_handler(hwnd, ctx):
    global csgo_launched
    if GetText(hwnd) == 'Counter-Strike: Global Offensive':
        csgo_launched = True


def csgo_is_not_ran():
    global csgo_launched
    WindowsHandler(enum_handler, None)
    result_csgo: bool = not csgo_launched
    del csgo_launched
    return result_csgo


def kill_all():
    if scripts['bunny_hop_running']:
        cmd_run('taskkill /f /im hnh_bhop.exe')
    if scripts['cross_hair_running']:
        cmd_run('taskkill /f /im hnh_crosshair.exe')


def check_window():
    while running:
        if GetText(GetCurrentWindow()) == 'Counter-Strike: Global Offensive':
            if scripts['bunny_hop_started'] and not scripts['bunny_hop_running']:
                run_program('hnh_bhop.vbs')
                scripts['bunny_hop_running'] = True
            time_sleep(1)
        else:
            if scripts['bunny_hop_started'] and scripts['bunny_hop_running']:
                cmd_run('taskkill /f /im hnh_bhop.exe')
                scripts['bunny_hop_running'] = False
            time_sleep(1)


def toggle_bunny_hop():
    global scripts
    if scripts['bunny_hop_started']:
        scripts['bunny_hop_started'] = False
        scripts['bunny_hop_running'] = False
        NewThread(target=lambda: cmd_run('taskkill /f /im hnh_bhop.exe')).start()
        ui.ahkbhopButton.setText('On')
    else:
        scripts['bunny_hop_started'] = True
        ui.ahkbhopButton.setText('Off')


def toggle_cross_hair():
    global scripts
    if scripts['cross_hair_running']:
        scripts['cross_hair_running'] = False
        NewThread(target=lambda: cmd_run('taskkill /f /im hnh_crosshair.exe')).start()
        ui.crosshairButton.setText('On')
    else:
        scripts['cross_hair_running'] = True
        NewThread(target=lambda: run_program('crosshair\\hnh_crosshair.exe')).start()
        ui.crosshairButton.setText('Off')


def setup_ui():
    ui.ahkbhopButton.clicked.connect(toggle_bunny_hop)
    ui.crosshairButton.clicked.connect(toggle_cross_hair)


if __name__ == '__main__':
    app = Widgets.QApplication([__name__])
    MainWindow = Widgets.QMainWindow()
    ui = NewMainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    if csgo_is_not_ran():
        running = False
        msg = MessageBox()
        msg.setIcon(MessageBox.Critical)
        msg.setWindowTitle('Error!')
        msg.setText('CSGO is not launched!')
        msg.show()
        clear_cache()
        msg.buttonClicked.connect(lambda: exit(1))
    setup_ui()
    NewThread(target=check_window).start()
    result = app.exec_()
    running = False
    kill_all()
    clear_cache()
    exit_(result)
