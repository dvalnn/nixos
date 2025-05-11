# unfreeze the last frozen job
export def main [ ] {
    let jobs = job list
    if ($jobs | length) == 0 {
        print -e "No jobs to unfreeze"
        return
    }

    job unfreeze ($jobs | last | get id)
}
