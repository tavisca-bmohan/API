pipeline 
{ 
	agent any 
	stages 
	{ 
		stage('Build') 
		{ 
			steps 
			{ 
		 		sh 'dotnet build API.sln -p:Configration=release -v:n' 	
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				sh 'dotnet test'
			} 
		}

		stage('Publish') 
		{ 
			steps 
			{ 
				sh 'dotnet publish'
			} 
		} 
		
		stage('Compress') 
		{
            		steps 
			{	
                		sh 'zip  Api.zip API/bin/Release/netcoreapp2.2/API.dll'
            		}
        	}
		
		stage('Deploy') 
		{
            		steps 
			{              
                		
				sh 'unzip Api.zip C:/Users/bmohan/Desktop'
                		sh 'dotnet run API.dll'
				             
            		}
        	}
		
	} 
	
}
