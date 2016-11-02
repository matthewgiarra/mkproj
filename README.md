MKPROJ creates a project directory structure. 

How to use mkproj

The program is called mkproj (located at /home/shannon/a/aether/.bin/mkproj.sh), and to run it, you just need to log into shannon and write the command

$ mkproj

or 

$ mkproj [new_project_directory]

Obviously don't enter the leading dollar signs.

If you run mkproj with no arguments, you'll be prompted to enter the path to your new project directory. You'll be prompted with a confirmation, and entering yes ('y' or 'yes') will create a new directory structure whose top-level directory is located at the path you typed.

How to "install" mkproj for your user account

To make this script work from anywhere on any system, login to shannon and copy-paste this into the terminal:

$ echo 'set path = ($path /home/shannon/a/aether/.bin)' >> $HOME/.login && source $HOME/.login

Doing this will allow you to call and run mkproj from anywhere on any of the original Aether compute notes (shannon, prandtl, etc.) running the TCSH shell (the default on Redhat). 

Caveats

- If you have used this code before, it used to automatically create directories within /home/shannon/a/aether/Projects. Since our server is now split between /a/ and /b/ filesystems, I've changed the script to create the project on whatever path you enter when invoking it. So to create a project in at /home/shannon/a/aether/Projects/[new_project_directory], you need to enter:

$ mkproj /home/shannon/a/aether/Projects/[new_project_directory]

- There used to be a problem with this code where the permissions on the new directory would get set incorrectly and only the project creator was able to modify files within it, but I think I've fixed that now.

- Currently, running the "install" command above will set the script to be callable from any of the original machines, but not the new machines. To get it to work for the new machines, you'll have to log into them individually and run the same command. You probably don't need to do this, though, since you can create projects from any of the old machines just fine.

What this script creates
The directory you enter when invoking mkproj will include sub-directories for codes, data, literature, presentations, etc. (description below). You should use these directories appropriately, and not store data in the code directories, code in the data directories, etc. 

The directories produced include the following:

[Project_directory] is located at the path you typed upon (or after) invoking mkproj, e,g., at /home/shannon/a/aether/Projects/[new_project_name]

Source codes are stored at:
[Project_directory]/analysis/src

Some projects have multiple codes that apply to them. Each top level directory within src should be a git repository. It should also be the only copy that you keep on the servers -- don't keep multiple copies of your codes floating around, because then it's hard for an outsider to know which is the most recent.

Data files (raw and processed data like images, .mat files, .dat files; NOT plots, presentations, videos, etc) are stored at:
[Project_directory]/analysis/data

Some projects have multiple different data sets that apply to them. They should all go in here, organized by data type or project in some sensible way. In my insects folder (/home/shannon/a/aether/Projects/insects), for example, I have analysis/data/xray_imaging and analysis/data/ultrasound_imaging, and within those the data are organized by the type of animal I imaged and then the date of collection. 

Relevant literature is stored at:
[Project_directory]/literature

Plots and figures are stored at:
[Project_directory]/results/figures

Videos are stored at:
[Project_directory]/results/videos

Presentations are stored at:
[Project_directory]/presentations

Manuscripts (documents that we are writing) are stored at:
[Project_directory]/manuscripts