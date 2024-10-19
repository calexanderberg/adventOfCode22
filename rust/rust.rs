fn main() {
    let args: Vec<String> = std::env::args().collect();

    std::process::Command::new("rustc")
        .arg(format!("./{}/{}/lib.rs", args[1], args[2]))
        .status()
        .expect("Failed to execute process");
}
