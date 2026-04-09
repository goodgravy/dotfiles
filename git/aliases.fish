alias glog "git log --graph --abbrev-commit --date=relative --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset'"
alias gp "git push origin HEAD"
alias gd "git diff --textconv"
alias gc "git commit"
alias gco "git checkout"
alias gs "git status -sb"
function gap
    for file in (git diff --name-only)
        echo ""
        git diff --textconv -- "$file"
        echo ""
        read -P "Stage $file? [y/n/q] " answer
        switch $answer
            case y Y
                git add -- "$file"
            case q Q
                return
        end
    end
end
function gcp
    for file in (git diff --name-only)
        echo ""
        git diff --textconv -- "$file"
        echo ""
        read -P "Discard changes to $file? [y/n/q] " answer
        switch $answer
            case y Y
                git checkout -- "$file"
            case q Q
                return
        end
    end
end
