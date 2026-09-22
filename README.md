# Tools for DH research crash course — DHDK 2026/27, 2nd year

This repo contains slides and bibliographies for the DHDK crash courses on Project Management and Research Tools offered to second year students of the DHDK master's programme at the University of Bologna, academic year 2026-2027. 

This is the first year these courses are being run for second-year students, as such they are a bit of an experiment. They take the first year courses students were offered the previous academic year as a starting point and aim to add some more relevant context primarily around the use of GenAI/LLMs and practical examples of how to apply standard Project Management practices and how to build and maintain Digital Humanities projects. 

The slides are build in Marp Markdown. They can be found under `lessons/NN/`. 

**Important: html slides contain hyperlinks, pptx slides DO NOT (this is a limitation of Marp). The markdown slides are the full slides.** 

For 2026-2027 **the `lessons/001` folder is the Project Management crash course** held September 23, 2026, while **`lessons/002` is the Research Tools crash course** held September 25, 2026. The bibliography folder contains a list of all bib and link references from the first year course as a quick ref guide alongside a new bib list for the 26-27 academic year (which will also be given to first year students). 

The rest of the files are used to generate slides. You need to have Marp installed locally. Run `./generate.sh` to export HTML + PPTX, `./server.sh` to preview. 

The theme for the slides is based on an existing css styling I originally built during my first year of the DHDK course in 2021, inspired by 1990s rap magazines, and in particular *The Source*. 

Claude Code is used to manage the local git and a local knowledge base in which I store some key literature to allow me to search references or ideas. It was also used to boilerplate the theme.css file from my existing use on my personal website (which was in turn created by me based on the DHDK project) as well as create some local scripts for ingesting files into the index. None of these files are available publicly. 

I'd like to acknowledge that the use of Marp for the slides is inspired by Sebastian Barzaghi's setup for the Digital Humanities and Data Management for Cultural Heritage course held in a.y. 25-26. 

All material within the dhdk-crash-courses repo is made available under a CC0-1.0 license. Don't be a dick (and equally lmk if you have good reasons to believe that the use of this license for these materials is problematic). 
