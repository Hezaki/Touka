{
  xdg.configFile."ansible/flatpak.yml".text = ''
---
- name: flatpak
  hosts: 127.0.0.1

  tasks:
    - name: addFlathub
      community.general.flatpak_remote:
        name: flathub
        flatpakrepo_url: https://dl.flathub.org/repo/flathub.flatpakrepo
        state: present

    - name: addFlathubBeta
      community.general.flatpak_remote:
        name: flathubBeta
        flatpakrepo_url: https://flathub.org/beta-repo/flathub-beta.flatpakrepo
        state: present

    - name: flatpakPermissions
      shell: doas flatpak override --filesystem=host

    - name: installBlockbench
      community.general.flatpak
        name: net.blockbench.Blockbench
        state: present
    '';
}
