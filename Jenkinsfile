pipeline 
{ 
	agent any 
	stages 
	{ 
		
		stage('Build') 
		{ 
			steps 
			{ 
		 		powershell(script: 'dotnet build API.sln -p:Configration=release -v:n')	
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				powershell(script: 'dotnet test')
			} 
		}

		stage('Publish') 
		{ 
			steps 
			{ 
				powershell(script: 'dotnet publish -c Release')
			} 
		} 
		
		stage('Compress') 
		{
            		steps 
			{
                		powershell(script: 'compress-archive API\\bin\\Release\\netcoreapp2.2\\publish\\* artifactFiles.zip -Update')
            		}
        	}
       
        	stage('Deploy') 
		{
            		steps 
			{
                		powershell(script: 'expand-archive artifactFiles.zip C:\\Users\\bmohan\\Desktop\\unzip -Force')
            		}
        	}	
	} 
	
}
