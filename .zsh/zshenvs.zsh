#!/usr/bin/zsh
export PATH=/usr/lib/ccache:$PATH
export PATH=~/go/bin:/usr/local/go/bin:$PATH
export EDITOR='nvim'
export VISUAL='nvim'
export GTK_IM_MODULE=ibus
export QT4_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus
ZSH_DISABLE_COMPFIX=true
# kitty themes
export KITTY_DARK_THEME=Afterglow
export KITTY_LIGHT_THEME=papercolor-light
# Sourcing CUDA
function source_cuda {
    CV=$1
    if [[ -d /usr/local/cuda-${CUDA_VER} ]]; then
        export CUDA_VER=$CV
        export PATH=/usr/local/cuda-${CUDA_VER}/bin:$PATH
        export CPATH=/usr/local/cuda-${CUDA_VER}/targets/x86_64-linux/include:$CPATH
        export LD_LIBRARY_PATH=/usr/local/cuda-${CUDA_VER}/targets/x86_64-linux/lib:/usr/local/cuda-${CUDA_VER}/lib64:$LD_LIBRARY_PATH
    else
        echo "CUDA version '$CV' not available."
    fi
}

# For Work
[ -f "~/.zsh/irobotics_env.zsh" ] && source ~/.zsh/irobotics_env.zsh
