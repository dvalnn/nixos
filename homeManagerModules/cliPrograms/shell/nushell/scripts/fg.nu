# unfreeze the last frozen job
export def main [ ] {
    let frozen = job list | where type == frozen
    if ($frozen | length) == 0 {
        print -e "No frozen to unfreeze"
        return
    }

    job unfreeze ($frozen | last | get id)
}
