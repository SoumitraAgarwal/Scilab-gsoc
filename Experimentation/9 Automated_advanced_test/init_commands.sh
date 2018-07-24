export PATH="/home/soumitra/anaconda3/bin:$PATH"
cd $(jupyter --runtime-dir)
rm -rf *
ipython kernel