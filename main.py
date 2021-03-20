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
    'cross_hair_running': False,
    'zoom_running': False,
    'zoom_started': False,
    'recoil_running': False,
    'recoil_started': False,
    'shake_running': False,
    'shake_started': False,
    'trigger_running': False,
    'trigger_started': False,
    'zeus_running': False,
    'zeus_started': False
}


def fast_read(filename):
    temp_file = open(filename, 'r')
    file_read = temp_file.read()
    temp_file.close()
    return file_read


def fast_write(content, filename):
    temp_file = open(filename, 'w')
    temp_file.write(content)
    temp_file.close()


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
    if scripts['zoom_running']:
        cmd_run('taskkill /f /im hnh_fastzoom.exe')
    if scripts['recoil_running']:
        cmd_run('taskkill /f /im hnh_no_recoil.exe')
    if scripts['shake_running']:
        cmd_run('taskkill /f /im hnh_shake.exe')
    if scripts['trigger_running']:
        cmd_run('taskkill /f /im hnh_trigger.exe')
    if scripts['zeus_running']:
        cmd_run('taskkill /f /im hnh_zeus.exe')


def check_window():
    while running:
        if GetText(GetCurrentWindow()) == 'Counter-Strike: Global Offensive':
            if scripts['bunny_hop_started'] and not scripts['bunny_hop_running']:
                run_program('hnh_bhop.vbs')
                scripts['bunny_hop_running'] = True
            if scripts['zoom_started'] and not scripts['zoom_running']:
                run_program('hnh_fastzoom.vbs')
                scripts['zoom_running'] = True
            if scripts['recoil_started'] and not scripts['recoil_running']:
                run_program('no_recoil.vbs')
                scripts['recoil_running'] = True
            if scripts['shake_started'] and not scripts['shake_running']:
                run_program('hnh_shake.vbs')
                scripts['shake_running'] = True
            if scripts['trigger_started'] and not scripts['trigger_running']:
                run_program('hnh_trigger.vbs')
                scripts['trigger_running'] = True
            time_sleep(1)
        else:
            if scripts['bunny_hop_started'] and scripts['bunny_hop_running']:
                cmd_run('taskkill /f /im hnh_bhop.exe')
                scripts['bunny_hop_running'] = False
            if scripts['zoom_started'] and scripts['zoom_running']:
                cmd_run('taskkill /f /im hnh_fastzoom.exe')
                scripts['zoom_running'] = False
            if scripts['recoil_started'] and scripts['recoil_running']:
                cmd_run('taskkill /f /im hnh_no_recoil.exe')
                scripts['recoil_running'] = False
            if scripts['shake_started'] and scripts['shake_running']:
                cmd_run('taskkill /f /im hnh_shake.exe')
                scripts['shake_running'] = False
            if scripts['bunny_hop_started'] and scripts['trigger_running']:
                cmd_run('taskkill /f /im hnh_trigger.exe')
                scripts['trigger_running'] = False
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


def toggle_fast_zoom():
    global scripts
    if scripts['zoom_started']:
        scripts['zoom_started'] = False
        scripts['zoom_running'] = False
        NewThread(target=lambda: cmd_run('taskkill /f /im hnh_fastzoom.exe')).start()
        ui.ahkfastzoomButton.setText('On')
    else:
        scripts['zoom_started'] = True
        ui.ahkfastzoomButton.setText('Off')


def toggle_no_recoil():
    global scripts
    if scripts['recoil_started']:
        scripts['recoil_started'] = False
        scripts['recoil_running'] = False
        NewThread(target=lambda: cmd_run('taskkill /f /im hnh_no_recoil.exe')).start()
        ui.ahknorecoilButton.setText('On')
    else:
        scripts['recoil_started'] = True
        ui.ahknorecoilButton.setText('Off')


def toggle_shake():
    global scripts
    if scripts['shake_started']:
        scripts['shake_started'] = False
        scripts['shake_running'] = False
        NewThread(target=lambda: cmd_run('taskkill /f /im hnh_shake.exe')).start()
        ui.ahkshakeButton.setText('On')
    else:
        scripts['shake_started'] = True
        ui.ahkshakeButton.setText('Off')


def toggle_trigger():
    global scripts
    if scripts['trigger_started']:
        scripts['trigger_started'] = False
        scripts['trigger_running'] = False
        NewThread(target=lambda: cmd_run('taskkill /f /im hnh_trigger.exe')).start()
        ui.ahktriggerButton.setText('On')
    else:
        scripts['trigger_started'] = True
        ui.ahktriggerButton.setText('Off')


def toggle_zeus():
    global scripts
    if scripts['zeus_started']:
        scripts['zeus_started'] = False
        scripts['zeus_running'] = False
        NewThread(target=lambda: cmd_run('taskkill /f /im hnh_zeus.exe')).start()
        ui.ahkzeusButton.setText('On')
    else:
        NewThread(target=lambda: cmd_run('hnh_zeus.vbs')).start()
        scripts['zeus_started'] = True
        ui.ahkzeusButton.setText('Off')


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
    ui.ahkfastzoomButton.clicked.connect(toggle_fast_zoom)
    ui.ahknorecoilButton.clicked.connect(toggle_no_recoil)
    ui.ahkshakeButton.clicked.connect(toggle_shake)
    ui.ahktriggerButton.clicked.connect(toggle_trigger)
    ui.ahkzeusButton.clicked.connect(toggle_zeus)


if __name__ == '__main__':
    app = Widgets.QApplication([__name__])
    MainWindow = Widgets.QMainWindow()
    ui = NewMainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    if csgo_is_not_ran():
        msg = MessageBox()
        msg.setIcon(MessageBox.Warning)
        msg.setWindowTitle('Warning!')
        msg.setText('CSGO is not launched!')
        msg.show()
    setup_ui()
    NewThread(target=check_window).start()
    result = app.exec_()
    running = False
    kill_all()
    clear_cache()
    exit_(result)
