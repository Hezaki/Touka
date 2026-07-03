{
  services.ollama = {
    enable = true;

    environmentVariables = {
      OLLAMA_VULKAN = "1";
    };
  };
}
