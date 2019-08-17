pipeline 
{ 
	agent any 
	stages 
	{ 
		
		stage('Build') 
		{ 
			steps 
			{ 
		 		bat ''dotnet build API.sln -p:Configration=release -v:n'' 	
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				bat ''dotnet test''
			} 
		}

		stage('Publish') 
		{ 
			steps 
			{ 
				bat ''dotnet publish -c Release''
			} 
		} 
		
		stage('Compress') 
		{
            		steps 
			{
                		bat ''compress-archive API\\bin\\Release\\netcoreapp2.2\\publish\\* artifactFiles.zip -Update''
            		}
        	}
       
        	stage('Deploy') 
		{
            		steps 
			{
                		bat ''expand-archive artifactFiles.zip C:\\Users\\bmohan\\Desktop\\unzip -Force''
            		}
        	}	
	} 
	
}
