"""A entrega contém apenas Bob e recupera uma seleção antiga de personagem removido."""
from pathlib import Path
import shutil
from types import SimpleNamespace
from unittest.mock import Mock

from PySide6.QtWidgets import QApplication

from bob import config
from bob.paths import Paths
from bob.settings_store import SettingsStore
from bob.ui.ui import SettingsDialog


def test_entrega_so_tem_bob_e_recupera_selecao_removida(tmp_path, monkeypatch):
    import bob.app as app_mod

    QApplication.instance() or QApplication([])
    root = Path(__file__).resolve().parent.parent
    shutil.copytree(root / "pets", tmp_path / "pets")
    paths = Paths(root=tmp_path)
    assert config.list_pets(paths) == [config.PET_PADRAO]
    settings = SettingsStore(paths)
    settings.update({"pet": "jorge", "bolinha": True})
    monkeypatch.setattr(app_mod, "PanicHotkey", lambda: SimpleNamespace(ok=True, pressed=Mock()))
    app = app_mod.BobApp(settings, paths)
    for timer in app.findChildren(app_mod.QTimer):
        timer.stop()
    assert app.nome == "Bob"
    assert app.pet_paths == paths.pet(config.PET_PADRAO)
    assert app.pet.aparencia.casca.name() == "#000000"
    assert app.pet.aparencia.olho.name() == "#ffffff"
    assert not app.ball.isVisible() and not app.mesa.caderno.isVisible()
    app.update_visibility()
    app.menu_close()
    app.toggle_hidden()
    assert app.pet.isVisible()
    assert not app.ball.isVisible() and not app.mesa.caderno.isVisible()
    app.mesa.tick(1.0, {}, 1000.0, True, app.behavior.play)
    assert not app.mesa.sentado
    dialog = SettingsDialog(settings.perms, paths, first_run=False)
    assert dialog.pet_combo.isHidden() and dialog.pet_aviso.isHidden()
    assert "bolinha" not in dialog.boxes
