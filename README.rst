Opti_SSR-examples
========

Example files to set up the SoundScape Renderer for local sound field synthesis using the opti_ssr package.
This repository contains easy-to-use scripts to start two SSR instances in their desired configuration.
Therefore the necessary ssr configuration files, scenes and reproduction setup scenes are provided here.

As of version 0.4.2 of the SSR there is a problem with the GUI that makes the SSR crash 
if a high number of sources are changing their position rapidly, while the position changes are sent via network messages.
Therefore it may be necessary to start the affected instance in non-GUI-mode to avoid these crashes.
This may not be the case in the future.

Source code:
    https://github.com/feliximmohr/opti_ssr-examples

Opti_SSR repository:
	https://github.com/feliximmohr/opti_ssr

Usage
-----
Run the desired script and pass a scene file. ::

	./LocalWFS_startup.sh <scene-file>
